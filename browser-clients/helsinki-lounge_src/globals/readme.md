### everything you always wanted to know about globals but were afraid to ask:

Global variables have a well-deserved fearsome reputation for screwing things up, usually when they are related to state, but can also screw up with namespace collisions on dependencies.

CSS as traditionally used is described as a global variable by some, and therefore to be avoided -- the inline CSS trend.  I do inline CSS for other reasons, but yes, a good point especially on very large projects.

I use globals to great effect in my reactjs apps just to get rid of boilerplate dependencies in every file.  It used to be just one file, but now I'm starting to do more advanced things with my inline css like preparing style classes in the inline sense, and I'm going to want to have these available globally to speed things up and help standardise.   
