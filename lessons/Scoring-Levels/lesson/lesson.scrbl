#lang curr/lib

@declare-tags[management]

@lesson/studteach[#:title "Scoring and Levels"
        #:duration "35 minutes"
        #:overview "Students learn how to add a scoring system and levels to their game"
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{Computers with }]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{
                                
                                
                                Ninja World is looking good, but right now there's not a lot of variety.
                                The player avoids the dog and gets the coin over and over again. We should
                                mix things up a bit: how about adding new levels? Typically a game would 
                                progress to a new level if the player has reached a certain goal: Collected
                                a certain number of rubies, destroyed a certain number of zombies, or reached
                                a certain score. Let's start by adding a scoring system to the Ninja World game.}
                        @teacher{Both the scoring system and randomizing the y-coordinates of the target and danger
                                 were part of the included teachpack in Bootstrap:1, code which ran "under the hood"
                                 in students' first Bootstrap game. Let them know that in Bootstrap:2, they no longer 
                                 @italic{need} this hidden code, because they've learned enough to program the entire 
                                 game (and more!) themselves.}}

                 @point{@student{The score is something that will be changing in the game, so you can be 
                                 sure that it has to be added to the World structure.
                                 @activity{@itemlist[@item{What data type is the score? Number, String, 
                                                           Image, or Boolean?}
                                                      @item{What will be the score in the @code{START} world?}
                                                      @item{Change the World structure so it includes a 
                                                            @code{score}.}]}
@code[#:multi-line #t]{data World:
                         # The World is the x and y positions of the dog, x position of the coin,
                         # x and y position of the cat, and the player's score
                         | world(dogX :: Number, dogY :: Number, coinX :: Number, catX :: Number, catY :: Number, score :: Number)
                       end}
                                 Remember: Since the World structure is changing, you now have to go through 
                                 your game code- @italic{every time} you make a world, the score must be included in 
                                 that world. @activity{How do you get the @code{score} out of the world?}}
                         @teacher{}}

                 @point{@student{Now that the game has a score, it needs to be able to increase or decrease. 
                                 In Ninja World, we'll say that the score should go up by 30 points when Ninja Cat collides 
                                 with the coin, and down by 20 points when colliding with the dog.
                                 @activity{@itemlist[@item{Which of the @code{ask} branches in 
                                                                        @code{next-world} checks these conditions?}
                                                      @item{How would you decrease the @code{score} by 20 if
                                                            the player collides with the dog?}]}

@code[#:multi-line #t]{fun next-world(current-world):
                           ask:
                             | is-collision(current-world.catX, current-world.catY, current-world.dogX, current-world.dogY) then: 
                               world(-50, num-random(480), current-world.coinX, current-world.catX, current-world.catY, current-world.score - 20)
                           end
                       end}

                                 @activity{On the next ask branch, make the score increase by 30 points 
                                           when the cat collides with the coin.}}
                         @teacher{}}

                 @point{@student{The scoring system is in place, but how will the player know what their score is? You'll need
                                 to display the score on the game screen. 
                                 @activity{Which function handles how the world is drawn?}
                                 In @code{draw-world}, images are placed onto the background using @code{put-image} to draw the
                                 game. But the score is represented by a Number: we need a way to represent it as an Image.
                                 Thankfully, Pyret has some built-in functions that can help with this: the function 
                                 @code{num-to-string} takes in a Number for its domain and returns a String representation 
                                 of that number. This string can then be passed to the @code{text} function to return an 
                                 Image that can then be used in @code{draw-world}. 
                                 @activity{Copy the following contracts into your workbook:
                                           @itemlist[@item{@code{num-to-string : Number -> String}}
                                                     @item{@code{text : String, Number, String -> Image}}
                                                     @item{How would you use the @code{num-to-string} and @code{text}
                                                           functions together to draw the score into the world?}
                                                     @item{How do you get the @code{score} out of the world?}
                                                     @item{How large should the text of the score be? Where should it be
                                                           placed on your game scene?}]}
                                 The expression:
                                 @code[#:multi-line #t]{put-image(text(num-to-string(current-world.score), 30, "purple"), 320, 240, BACKGROUND-IMG)}
                                  will place the score (drawn in size 30 purple text) onto the center of the BACKGROUND-IMG.}
                         @teacher{}}

                 @point{@student{Ninja World has a visible scoring system: Now it's time to add some levels. For 
                                 this example, you'll make the game have a different background image when
                                 the player progresses to the next level. The player will reach level two 
                                 when his or her score is greater than 500.
                                 @activity{Where do you define the @code{BACKGROUND-IMG} image? Keep the original 
                                           background for the first level, but define a new variable, 
                                           @code{BACKGROUND2-IMG}, that will be used for level 2.} 
                                 Now that you have another background image, it needs to be drawn into the 
                                 game- but @bold{only} when a certain condition is met. 
                                 @activity{@itemlist[@item{What must be true for the player to progress to
                                                           level 2 in the game?}
                                                      @item{Which function handles the way the game looks?}
                                                      @item{What is the only thing different in level 2 of Ninja World?}]}}
                         @teacher{}}
                 @point{@student{The only thing that changes at level 2 is the way the game @italic{looks}: 
                                 specifically, the background image. Because the background only changes when 
                                 a certain condition is met, you'll need to change the @code{draw-world} 
                                 function so that it uses @code{ask}. Leave the current code alone for now
                                 and start right under @code{fun draw-world(current-world):}. 
                                 @activity{@itemlist[@item{What is the first thing to write, to let the computer 
                                                           know that this will be a function with different 
                                                           conditions?}
                                                      @item{What is the first condition to check? (Hint: is 
                                                            the score large enough to progress to level 2?)}]}
@code[#:multi-line #t]{fun draw-world(current-world):
                           ask:
                             | current-world.score > 500 then: ......
                           end
                       end}

                                 If this test evaluates to @code{true}, the result will look similar to the 
                                 code you already have for draw-world, starting with @code{put-image}. 
                                 @activity{What is the one thing that needs to change?}
                                 Instead of putting all your images on top of @code{BACKGROUND-IMG}, you'll put 
                                 them over @code{BACKGROUND2-IMG}, your new background image:
@code[#:multi-line #t]{fun draw-world(current-world):
                           ask:
                             | current-world.score > 500 then: put-image(NINJA-IMG, current-world.catX, current-world.catY,
                                                       put-image(COIN-IMG, current-world.coinX, 300,
                                                           put-image(CLOUD-IMG, 500, 400,
                                                               put-image(DOG-IMG, current-world.dogX, current-world.dogY, BACKGROUND2-IMG))))
                           end}}
                         @teacher{}}
                 @point{@student{@activity{Don't forget to add an @code{otherwise} clause before your original code, 
                                           right underneath what you just wrote. If the score is @bold{not} 
                                           greater than 500, the world will be drawn with the images on the 
                                           original background.}
                      @code[#:multi-line #t]{| otherwise: put-image(NINJA-IMG, current-world.catX, current-world.catY,
                                                              put-image(COIN-IMG, current-world.coinX, 300,
                                                                  put-image(CLOUD-IMG, 500, 400,
                                                                      put-image(DOG-IMG, current-world.dogX, current-world.dogY, BACKGROUND-IMG))))}

                                   Now Ninja World has a level 2! You can use the same process to add more levels 
                                   when the score gets even higher. Maybe instead of the background changing, you 
                                   can have the player transform, or make the game more difficult by making the 
                                   dog move faster.}
                         @teacher{These modifications can be seen in action in the 
                                   @editor-link[#:public-id "0B9rKDmABYlJVbnRQUGF4ZjMwSGs" "Completed Ninja World file"].

                                   Some more options for students who finish early: 
                                   @itemlist/splicing[@item{Change the next-world function so that the dog and
                                                            coin move faster if the score is greater than 500.}
                                                       @item{Use the text function to display a game over message 
                                                             on the screen when the score drops below 0.}
                                                       @item{Change the images of all the game characters when the 
                                                             player progresses to the next level.}
                                                        @item{@bold{Challenge:} Instead of writing similar code in @code{draw-world} over and over for each level, use abstraction: write a function that takes in the background image, and returns the game images placed on top of the given background. This function can then be called within @code{draw-world} with the appropriate background image when the player reaches each level.}]}}
                 ]
         }