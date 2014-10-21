require 'yaml'

DIR = File.expand_path(File.dirname(__FILE__))
MANIFEST = YAML.load(::File.read(::File.join(DIR, 'manifest.yaml')))

namespace :install do
  MANIFEST.each do |cfg, files|
    desc "Configure #{cfg} from dotfiles repo"
    task cfg do
      files.each { |k, v| install_cfg(k, v) } 
    end
  end

  def install_cfg(src, dest, opts={})
    cp(::File.join(DIR, src), ::File.expand_path(dest), opts)
  end
end

namespace :backup do
  MANIFEST.each do |cfg, files|
    desc "Backup local #{cfg} into dotfiles repo"
    task cfg do
      files.each { |k, v| backup_cfg(v, k) } 
      `git status`
    end
  end

  def backup_cfg(src, dest, opts={})
    cp(::File.expand_path(src), ::File.join(DIR, dest), opts)
  end
end

namespace :diff do
  MANIFEST.each do |cfg, files|
    desc "Diff dotfiles repo with local config for #{cfg}"
    task cfg do
      files.each { |k, v| diff_cfg(k,v) } 
    end
  end

  def diff_cfg(src, dest)
    cmd = "colordiff #{::File.join(DIR, src)} #{::File.expand_path(dest)}"
    puts cmd
    system(cmd)
  end
end

%i(install backup diff).each do |ns|
  desc "#{ns.to_s} all dotfiles"
  task ns => MANIFEST.keys.map {|k| "#{ns}:#{k}" }
end
