- dockerize the whole thing to make it easier to run
- introduce rubocop for style checking
- more renderers and rejig renderer namespacing
- instead of command line interface options, we should have configuration options which are more general
- not using if..else to instantiate renderers
- clean up the main initialization
- introduce abstraction for where we send output, so that we can configure output location
- easily support multiple robots
- input reader and input parser are not flexible enough as they only support line based inputs
- input reader and input parser should be written to support easier extensions, i.e. base classes
- command factory could be better
- facing direction is too complex and inflexible in terms of adding new facing directions
- add # frozen_string_literal: true as appropriate

- rebuild some/all of it using some dry.rb concepts

* support the robot
