# Robot Challenge

The description of the problem can be found in [PROBLEM.md](PROBLEM.md).

## Usage

To avoid dependency issues the application is dockerised, build the docker image first:

```bash
docker build -t robot_challenge .
```

We can now run it:

```bash
docker run -it robot_challenge
```

For a more interactive experience, we can run bash inside the docker container:

```bash
docker run -it --entrypoint /bin/bash robot_challenge
```

We can now run the application or test etc.

The executable script is `bin/robot_challenge`.

If you want to run tests you can `rspec spec` or `rake spec`.

This repo is built like a gem, so `bundle install` will bring in dependencies. The only dependencies are `rake`, `rspec` and a few `robocop` gems (and `bundler`). There are no runtime dependencies (this is by design).

You can do `bin/robot_challenge -h` and it should print out some info for you.

To summarise, the simplest way to run it is just `bin/robot_challenge`, it will sit there waiting for input. You can start entering
commands, errors will be printed for invalid commands or invalid arguments (for PLACE command). Nothing will be printed for valid
commands that were successfully executed, you'll have to use the report command to see if it's doing the right thing.

Commands (and arguments for PLACE) can be lower or upper case.

For more fun, I suggest running it like this `bin/robot_challenge -r ascii`, this is similar to above, but after every command it
will print out an ascii representation of the table e.g.:

```plain
> bin/robot_challenge -r ascii
place 3,3,south
---------------------
|   |   |   |   |   |
---------------------
|   |   |   | v |   |
---------------------
|   |   |   |   |   |
---------------------
|   |   |   |   |   |
---------------------
|   |   |   |   |   |
---------------------
```

There is a file with some test data `test_data.txt`, you can pipe it to executable:

```bash
bin/robot_challenge < test_data.txt
```

It has some commands before a place, an invalid command and a bunch of other stuff, it should produce the following output:

```plain
Invalid command given FOOBAR
1,1,NORTH
1,3,NORTH
1,3,EAST
3,3,EAST
1,0,EAST
0,0,SOUTH
0,0,SOUTH
0,0,NORTH
0,1,NORTH
```

## Thoughts and assumptions

The original problem definition doesn't state what the goal of this coding test exercise is.
Is it to produce any working, "correct" solution to the problem?
Is it to demonstrate good OO skills?
Demonstrate good domain modelling skills?

I made the assumption that it's all of the above (to some extent). So approaching this, relatively small, problem as if it's
a larger one which needs to account for some level of extensibility, changing requirements etc. Having said that, since I've
done this coding test before, I also decided to implement a smallest working solution, code-golf style. You can find it at:

```bash
simple/robot_challenge
```

It's 30 lines of non-boilerplate code. It's not quite as robust as it could be, but it fulfils the problem requirements. Execute it in the same way as above if it's of interest. In my case it was just for the purposes of bonus fun :).

There are many questions that can be asked to clarify the requirements of this problem. These include:

Is the table size static, might we want to change it at some point?

- I made the table size configurable

If we tell robot to move off the edge of the table, how do we handle this? Do nothing? Output an error? If we want to output an error,
where do we want to output it STDERR, file etc.?

- I chose to do nothing

Can the origin change e.g. 0,0 in the North-West corner instead of South-West?

- I chose to assume that, it can't change, to make my life easier.

Report command outputs to STDOUT, is this likely to change?

- I chose to assume that always to STDOUT is fine.

Can new commands be introduced?

- I chose to assume that as a likely change vector, so the design facilitates that relatively easily.

### More thoughts

There is an abstraction provided for the source of the input as well as the format of the input, so if we want to take input from
somewhere other than STDIN (e.g. from the network), we can write a different `InputReader` and hook it into `main.rb` and we're
good to go.

Similarly if the format of the input was to change, we can write an alternative `InputParser`, hook it in and we're
good to go. I didn't bother abstracting the output destination or error destination, if that needs to be done, it can be done in
a similar way (alternatively `$stdout` and `$stderr` can be redefined if we really have to).

It should also be relatively easy to add new commands for the robot, by implementing classes as well as new move
directions (this is a little more complex as `FacingDirection` class would need to be decorated/reimplemented in
addition to providing the logic for moving in the new direction).

There is also an integration test `spec/robot_application/main_integration_spec.rb` which I've chosen to mix in with the unit
test, just for the sake of simplicity and the fact that we only really need the one.

I've also thought about whether or not it would be important for us to keep all the robot control logic together, instead of spread
into separate classes. I decided to explore this further in `suboptimal/robot_challenge`, but we ended up with one very big class with
a potentially infinite interface in the face of new requirements as well as suffering greatly in terms of testability. It does work
however and can be run in the same was as above `suboptimal/robot_challenge < test_data.txt` :).
