# Parser: Ruby Developer Test

This project is a code test for Smart Pension. 

### Getting Started
There are 2 steps to get started. Firstly, you need to setup the project and
all it's dependencies.

```bash
bin/setup
```

Once that has completed you can go ahead and run the script like this:

```bash
./parser.rb logs/webserver.log
```

If you want to provide a different log file simply change the argument to
the relative path of the log file you wish to parse.

### Executing the script

```bash
ruby parser.rb logs/webserver.log
```

### Returns the following:

```bash
unique
/help_page/1 23 unique views
/contact 23 unique views
/home 23 unique views
/index 23 unique views
/about/2 22 unique views
/about 21 unique views
```