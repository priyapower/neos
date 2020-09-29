# Working with Arique on Refactoring

### Explore the code
1. With your partner look through start.rb and near_earth_objects.rb
1. Discuss is this 'good' or 'bad' code? Why?
  #### START
      - In the start file, there is a good chunk of code that is just about making a table
      - Even the print information can be contained in the class or separate file?
      - lines 3-6 convert into class method or new file (possible def intro_message in NearEarthObjects)
      - Line 8 belongs where? can it live in the method with message above? Or stay in the runner?
      - Pretty much lines 33-41 should be mostly what is in it, with changes for how they are called
      #### START
      - Whats up with the figaro information outside the class? (line 7-8)
      - Looks like 1 very large self method
      - Misspelled 'asteroid' in various locations
      - Ln 14, 'date' is the passed param which comes from the start.rb which comes from CLI
      - FEELING MOST CONFIDENT: converting NearEarthObjects from a single self. to an instance fo NearEarthObjects that we can call various methods upon
      - regarding the figaro info: perhaps we CAN put this in it's own file, be cautious since this is how our API key is reading?

### Identify the responsibilities
1. With your Partner, identify the different responsibilities that exist in each file.
    1. Does this adhere to SRP?
    1. How would you utilize encapsulation and abstraction to refactor this code?
    1. What tools/strategies could you utilize to make this code adhere to SRP?

### Refactor
1. Declarative Programming:
    1. Write the code you wish existed above the existing code
    Keep the code that is currently working. Don't delete it until the new code is working. This way you will always have a passing solution
        - f
        - f
1. Red, Green, Refactor:
    1. Utilize tests to keep you moving in the right direction
    Follow the errors in the test to guide you each step of the way
        - f
