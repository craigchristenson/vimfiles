#!/usr/bin/env ruby

git_bundles = [
  "git://github.com/godlygeek/tabular.git",
  "git://github.com/msanders/snipmate.vim.git",
  "git://github.com/pangloss/vim-javascript.git",
  "git://github.com/scrooloose/nerdtree.git",
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/tpope/vim-git.git",
  "git://github.com/tpope/vim-markdown.git",
  "git://github.com/tpope/vim-repeat.git",
  "git://github.com/tpope/vim-surround.git",
  "git://github.com/nanotech/jellybeans.vim.git",
  "git://github.com/tsaleh/taskpaper.vim.git",
  "git://github.com/tsaleh/vim-matchit.git",
  "git://github.com/tsaleh/vim-shoulda.git",
  "git://github.com/tomtom/tcomment_vim.git",
  "git://github.com/tsaleh/vim-tmux.git",
  "git://github.com/vim-ruby/vim-ruby.git",
  "git://github.com/vim-scripts/Gist.vim.git",
  "git://github.com/scrooloose/syntastic.git",
  "git://github.com/sjl/gundo.vim.git",
  "git://github.com/vim-scripts/taglist.vim.git",
  "git://github.com/vim-scripts/FuzzyFinder.git",
  "git://github.com/vim-scripts/L9.git",
  "git://github.com/vim-scripts/molokai.git",
  "git://github.com/rosenfeld/rgrep.vim.git",
  "git://github.com/terryma/vim-multiple-cursors.git",
  "git://github.com/kana/vim-scratch.git"
]

vim_org_scripts = [
  ["IndexedSearch", "7062",  "plugin"],
  ["jquery",        "12107", "syntax"],
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

vim_org_scripts.each do |name, script_id, script_type|
  puts "downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.vim")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
end
