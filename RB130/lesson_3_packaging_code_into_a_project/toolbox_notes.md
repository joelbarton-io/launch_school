- [rubygems](./toolbox_notes.md)
- [rvm_rbenv](./toolbox_notes.md)
- [bundler](./toolbox_notes.md)
- [rake](./toolbox_notes.md)

## goal: *"formulate a mental model of how the pieces fit together"*
# rubygems
- packages of code (gems)

- https://rubygems.org/ ; gem install GEMNAME
- where gem creates the local library depends on several factors, including whether you are using a system Ruby that needs root access, a user maintainable Ruby, the specific Ruby version number, and whether you use a Ruby version manager, e.g., rbenv or RVM
- issues? -> gem env`
# rvm_rbenv
- different ruby version managers
- retrieves from remote lib -> downloads to local lib
# bundler
# rake
rbenv global 2.3.1
