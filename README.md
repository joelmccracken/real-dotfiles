# real-dotfiles

my actual dotfiles & workstation setup/configuration scripts

# developing a "bootstrap" script
- done work getting `brew bundle` set up; seems to work reasonably well
- developed `workstation bootstrap` to support installation etc of bundler

# components

~/bin/workstation contains the two commands `workstation install` and `workstation check`
idea is that this can do a ls of ~/install and ~/check and execute each, showing each
(someday break install and check into separate things?)
(use proplellor instead once i know haskell well enough?)

~/bin/status can act as status checker, doing "quick checks" of system health
bitbar plugin in menubar also shows this output

~/Projects/elixir_supervisor contains a WIP app that runs rclone on a regular basis
~/Projects/elixir_supervisor/lib/tasks/service.ex contains script that will create launchagent plist and
launchctl load it. this target file is not git controlled (should it be? would be easier to find next time I try to find it with git ls-files)

~/Projects/reddup
file in library/launchagents controls the regular running of this; TODO unify with
component in ~/bin/redd-up currently runs old ruby version
component in ~/bin/reddup runs haskell replacement-in-progress

# Organization

~/bin - scripts i need to run
~/lib - arbitrary library files (not launchagents? what *actually* goes here? this may be going away unless
~/var - holding data
~/app - things by topic; not project-sepecific? (how is this differet)

# Tasks

- write script that tests that backups can be restored from server

# Questions

- what is the difference organizationally between an app and a project? should apps be unified under projects?
- what operations should be available upon a given "thing" (thing=component, i think)? check, install, remove?
- how handle "currently using" version of software from "currently in development" versions? ("feature flags"?)
- how make each component "minimal"? assume ruby without any libraries for bootstrap process? acceptable or not?
- what can I move into docker ENVs?

# Bootstrapping
- how much testing is "good enough"?

# planning
setup/check scripts
