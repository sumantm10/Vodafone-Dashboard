<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%String leftAds = request.getParameter("articleId");%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tab Slider Demo - Jssor Slider, Carousel, Slideshow with Javascript Source Code</title>
<link href="css/layouthome.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>


    <!-- Caption Style -->
    <style> 
        .captionOrange, .captionBlack
        {
            color: #fff;
            font-size: 20px;
            line-height: 30px;
            text-align: center;
            border-radius: 4px;
        }
        .captionOrange
        {
            background: #EB5100;
            background-color: rgba(235, 81, 0, 0.6);
        }
        .captionBlack
        {
        	font-size:18px;
            background: #000;
            background-color: rgba(0, 0, 0, 0.4);
        }
        a.captionOrange, A.captionOrange:active, A.captionOrange:visited
        {
        	color: #ffffff;
        	text-decoration: none;
        }
        a.captionOrange:hover
        {
            color: #eb5100;
            text-decoration: underline;
            background-color: #eeeeee;
            background-color: rgba(238, 238, 238, 0.7);
        }
        .bricon
        {
            background: url(../img/browser-icons.png);
        }
        #slider1_container
        {
        
		margin:0;
		margin-left: 250px;
		margin-top:10px;  
        }
        
    </style>
    <!-- it works the same with all jquery version from 1.x to 2.x -->
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <!-- use jssor.slider.mini.js (40KB) instead for release -->
    <!-- jssor.slider.mini.js = (jssor.js + jssor.slider.js) -->
    <script type="text/javascript" src="js/jssor.js"></script>
    <script type="text/javascript" src="js/jssor.slider.js"></script>
    <script>

        jQuery(document).ready(function ($) {
            var options = {
                $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $AutoPlaySteps: 1,                                  //[Optional] Steps to go for each navigation request (this options applys only when slideshow disabled), the default value is 1
                $AutoPlayInterval: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $PauseOnHover: 1,                               //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                $SlideDuration: 500,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
                //$SlideWidth: 600,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
                //$SlideHeight: 300,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                $SlideSpacing: 5, 					                //[Optional] Space between each slide in pixels, default value is 0
                $DisplayPieces: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
                $ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
                $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
                $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
                $DragOrientation: 3,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

                $ThumbnailNavigatorOptions: {
                    $Class: $JssorThumbnailNavigator$,              //[Required] Class to create thumbnail navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always

                    $ActionMode: 1,                                 //[Optional] 0 None, 1 act by click, 2 act by mouse hover, 3 both, default value is 1
                    $AutoCenter: 3,                             //[Optional] Auto center thumbnail items in the thumbnail navigator container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 3
                    $Lanes: 1,                                      //[Optional] Specify lanes to arrange thumbnails, default value is 1
                    $SpacingX: 1,                                   //[Optional] Horizontal space between each thumbnail in pixel, default value is 0
                    $SpacingY: 0,                                   //[Optional] Vertical space between each thumbnail in pixel, default value is 0
                    $DisplayPieces: 5,                              //[Optional] Number of pieces to display, default value is 1
                    $ParkingPosition: 0,                            //[Optional] The offset position to park thumbnail
                    $Orientation: 1,                                //[Optional] Orientation to arrange thumbnails, 1 horizental, 2 vertical, default value is 1
                    $DisableDrag: true                              //[Optional] Disable drag or not, default value is false
                }
            };

            var jssor_slider1 = new $JssorSlider$("slider1_container", options);

            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizes
            function ScaleSlider() {
                var parentWidth = jssor_slider1.$Elmt.parentNode.clientWidth;
                if (parentWidth) {
                    var sliderWidth = parentWidth;

                    //keep the slider width no more than 600
                    sliderWidth = Math.min(sliderWidth, 800);

                    jssor_slider1.$ScaleWidth(sliderWidth);
                }
                else
                    window.setTimeout(ScaleSlider, 30);
            }
            ScaleSlider();

            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            //responsive code end
        });
    </script>
    <!-- Jssor Slider Begin -->
    <!-- To move inline styles to css file/block, please specify a class name for each element. --> 
    <div id="slider1_container" style="position: relative; top: 0px; left: 0px; width: 1100px; height:550px; background: #fff; overflow: hidden; ">
        
        <!-- Slides Container -->
        <div u="slides" style="cursor: move; position: absolute; left:0px; top: 27px; width: 1100px; height: 550px;
            overflow: hidden;">
            <div>
                <img src="images/Slide1.PNG" height="520px" width="1100px"/>
                <div u="thumb">Delhi National STP</div>
            </div>
            <div>
                <img src="images/Slide2.PNG" height="520px" width="1100px"/>
                <div u="thumb">Delhi Regional STP</div>
            </div>
            <div>
                <img src="images/Slide3.PNG" height="520px" width="1100px"/>
                <div u="thumb">Delhi SCR</div>
            </div>
           
        </div>
        
        <!--#region ThumbnailNavigator Skin Begin -->
        <style>
            /* jssor slider thumbnail navigator skin 14 css */
            /*
            .jssort14 .p            (normal)
            .jssort14 .p:hover      (normal mouseover)
            .jssort14 .pav          (active)
            .jssort14 .pav:hover    (active mouseover)
            .jssort14 .pdn          (mousedown)
            */

            .jssort14 {
                position: absolute;
                width: 580px;
                height: 27px;
                background: #868686;
                height: 35px;
            }

                .jssort14 .p {
                    position: absolute;
                    width: 200px;
                    height: 35px;
                    top: 0;
                    left: 0;
                    padding: 0px;
                    background: #868686;
                }

                .jssort14 .w {
                    cursor: pointer;
                    position: relative;
                    WIDTH: 100%;
                    HEIGHT: 100%;
                    
                    background-color: #868686;
                }

                .jssort14 .pdn .w, .jssort14 .pav .w, .jssort14 .p:hover .w {
                    background-color: #422e2c;
                    height: 35px;
                }

                .jssort14 .c {
                    width: 100%;
                    height: 30px;
                    position: absolute;
                    top: 0;
                    left: 0;
                    line-height: 28px;
                    text-align: center;
                    color: #000;
                    height: 30px;
                    font-size: 18px;
                    background-color: #e6e0c8;
                    transition: background-color .6s;
                    -moz-transition: background-color .6s;
                    -webkit-transition: background-color .6s;
                    -o-transition: background-color .6s;
                }

                .jssort14 .p:hover .c, .jssort14 .pav:hover .c, .jssort14 .pav .c {
                    transition: none;
                    -moz-transition: none;
                    -webkit-transition: none;
                    -o-transition: none;
                }

                .jssort14 .pav .c {
                    background-color: #ffab57;
                }

                .jssort14 .p:hover .c, .jssort14 .pav:hover .c {
                    background-color: #fc9835;
                }
        </style>

        <div u="thumbnavigator" class="jssort14" style="left:0px; top: 0px;">
            <!-- Thumbnail Item Skin Begin -->
            <div u="slides" style="cursor: default; top:0px; left:0px;">
                <div u="prototype" class="p">
                    <div class=w><div u="thumbnailtemplate" class="c"></div></div>
                </div>
            </div>
            <!-- Thumbnail Item Skin End -->
            <a style="display: none" href="http://www.jssor.com">Bootstrap Slider</a>
        </div>
        <!--#endregion ThumbnailNavigator Skin Begin -->
    </div>
    <!-- Jssor Slider End -->
</body>


</html>