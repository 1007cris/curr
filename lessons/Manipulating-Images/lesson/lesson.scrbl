#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Manipulating Images"
        #:duration "20 minutes"
        ]{
  @itemlist/splicing[
    @tag[pedagogy]{@item{This section gets kids doing more than one level of circle, thus fitting contracts together and practicing the substitution model. You can get them to practice more than one level of circle using non-image things like @code{(* @code{2} (+ @code{3 4}))} and @code{(+ (string-length @code{"cat"}) @code{5})}, but changing images may be more compelling.}}
    @tag[selftaught]{@item{In this section, you will learn to do more with shapes. As we saw in Circles of Evaluation, you can put circles inside circles to evaluate things like @code{(* @code{2} (+ @code{3 4}))} and @code{(+ (string-length @code{"cat"}) @code{5})}. Similarly, you can apply another function to something that evaluates to a shape in order to change the way it looks!}}
    @item{Of course, you can do more with your images than just create them!}
    @item{There are also functions that allow you to stretch, scale and even rotate them!}
    @item{Here are contracts for some functions that allow you to do this. Copy them into your notebook, and try to do the following exercises @tag[group]{with a partner}: @linebreak[]
          @code[#:contract "flip-horizontal : Image -> Image"] @linebreak[]
          @code[#:contract "flip-vertical : Image -> Image"] @linebreak[]
          @code[#:contract "scale : Number Image -> Image"] @linebreak[]
          @code[#:contract "scale/xy : Number Number Image -> Image"] @linebreak[]
          @code[#:contract "rotate : Number Image -> Image"] @linebreak[]
          @code[#:contract "overlay : Image Image -> Image"]}
    @item{@exercise{Can you make a blue triangle that's rotated on its side?}}
    @item{@exercise{What if you didn't have access to @code{ellipse}? Can you make me an ellipse by using only @code{scale/xy} and @code{circle}?}}
    @tag[pedagogy]{@item{Let kids experiment with these functions and point out interesting results to the class}}
    @item{Experiment with the functions you just learned!
          @embedded-wescheme[#:id "Manipulating Images"
            #:interactions-text""
            #:hide-definitions? #t]}
    @item{If you'd like more exercises involving images and more complex composition, check out the supplemental @(hyperlink "../../Making-Flags/lesson/lesson.html" "Flags Activity").}]}
