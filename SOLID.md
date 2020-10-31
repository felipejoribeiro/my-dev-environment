# SOLID software development patterns:
---
Here we will study some good practices in software development, with the SOLID design patterns made for object oriented programming. It's described by the acronym S.O.L.I.D where each letter representes a principle for better code writing. All of then were made by the famous uncle bob and are as follows:

- S: Single responsibility principle;
- O:
- L:
- I:
- D:

## S : Single Responsibility Principle: Every module or class should have responsibility over a single part of the functionality provided by the software, and that responsibility should be entirely encapsulated by the class, module or function. A class should have one, and only one, reason to change. (Robert C. Martin - UNCLE BOB)

A program is like a workshop. Where you can do all sorts of things. If a bunch of stuff is done in the workshop it's natural that there would be lots and lots of tools and equipment there. As an example, if you create furniture in this workshop, there shall be a handsaw or hammer with nails, and surely lots of wood. So, in this situation you have two options of organizing things. One is leaving all things scattered in the room, on the floor and hanging on the walls. And the other is keeping stuff in small and regular boxes well named and organized. The second option works best. We call those boxes "Classes" around here. These classes are good to label functionalities and keep then separated in different files (boxes). Each class should keep functions or information that are correlated. And they should have one and just one objective. There should be a hammer class, ready to hammer anything that we should smash. We shouldn't smash a nail in the wood using anything other than the hammer class. And there should be only one box for this. There may be numerous hammers of a diversity of shapes and sizes, but they all should be in the same box, the hammer box. And if a nail breaks when you are doing a table, you know were is the problem, maybe you used the wrong hammer, or maybe you need a new one, but you know were the problem is and you know what must be done. Besides that, if we start putting things in the same box, that box would start growing and we would end with a file with thousands of lines. That would be even worst than having things scattered through the workshop. So that's it, let's maintain things separated, labeled and organized. That is the power of the single Responsibility principle. This is important too because this separate responsibilities, the result is a code where you don't need to understand everything to change something, what isn't good for large projects. 



