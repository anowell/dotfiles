use anyhow::Result;
use clap::{ArgEnum, Parser};
use duct::cmd;
use std::collections::HashMap;
use std::env::current_dir;
use std::fs;
use std::path::PathBuf;

#[derive(Parser, Debug)]
struct Args {
    #[clap(arg_enum)]
    cmd: Option<Cmd>,
    /// Get possible values by running 'dotfiles'
    app: Option<String>,
}

#[derive(ArgEnum, Debug, Copy, Clone)]
enum Cmd {
    /// Installs files from dotfiles repo to system
    Install,
    /// Backup files from system to dotfiles
    Backup,
    /// Compare system to dotfiles
    Diff,
}

fn main() -> Result<()> {
    let args: Args = Args::parse();
    let manifest: HashMap<String, HashMap<String, String>> =
        toml::from_str(&fs::read_to_string("manifest.toml")?)?;
    let apps: Vec<String> = manifest.keys().map(ToString::to_string).collect();
    let configs = match args.app {
        Some(app) => manifest.get(&app).unwrap().clone(),
        None => {
            let mut map = HashMap::new();
            for (_, v) in manifest {
                map.extend(v);
            }
            map
        }
    };

    match args.cmd {
        Some(Cmd::Install) => install(&configs)?,
        Some(Cmd::Backup) => backup(&configs)?,
        Some(Cmd::Diff) => diff(&configs)?,
        None => {
            println!("Usage: dotfiles <cmd> [app]");
            println!("Commands: install, backup, diff");
            println!("Apps:");
            for app in apps {
                println!("  {}", app);
            }
        }
    }

    Ok(())
}

fn install(configs: &HashMap<String, String>) -> Result<()> {
    for (k, v) in configs {
        println!("Install {}", v);
        let install_path = PathBuf::from(&*shellexpand::full(v)?);
        if let Some(parent) = install_path.parent() {
            let _ = fs::create_dir_all(&parent);
        }
        fs::copy(current_dir()?.join(k), install_path)?;
    }
    Ok(())
}

fn backup(configs: &HashMap<String, String>) -> Result<()> {
    for (k, v) in configs {
        println!("Backup {}", v);
        let install_path = PathBuf::from(&*shellexpand::full(v)?);
        fs::copy(install_path, current_dir()?.join(k))?;
    }
    Ok(())
}

fn diff(configs: &HashMap<String, String>) -> Result<()> {
    for (k, v) in configs {
        println!("colordiff {} {}", v, k);
        let install_path = PathBuf::from(&*shellexpand::full(v)?);
        if install_path.exists() {
            cmd!("colordiff", k, install_path).run()?;
        } else {
            println!("Not installed: {}", v);
        }
    }
    Ok(())
}
