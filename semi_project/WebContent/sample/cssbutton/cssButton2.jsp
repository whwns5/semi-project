<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('http://fonts.googleapis.com/css?family=Roboto+Condensed');

.preserve-3d {
    transform-style: preserve-3d;
    -webkit-transform-style: preserve-3d;
}

body {
    padding: 0;
    margin: 0;
    border: 0;
    overflow-x: none;
    background-color: #ffffff;
    font-family: Roboto Condensed, sans-serif;
    font-size: 12px;
    font-smooth: always;
    -webkit-font-smoothing: antialiased;
}

.back {
    width: 33%;
    height: 200px;
    float: left;
    background-color: #eeeeee;
    border: 10px;
    border-color: #ffffff;
    border-style: solid;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    counter-increment: bc;
    padding: 0px 5px 5px 5px;
}

.back:before {
    content: counter(bc) "_";
    position: absolute;
    padding: 10px;
}

@media screen and (max-width: 1260px) {
    .back {
        width: 50%;
    }
}

@media screen and (max-width: 840px) {
    .back {
        width: 100%;
    }
}

.button_base {
    margin: 0;
    border: 0;
    font-size: 18px;
    position: relative;
    top: 50%;
    left: 50%;
    margin-top: -25px;
    margin-left: -100px;
    width: 200px;
    height: 50px;
    text-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
}

.button_base:hover {
    cursor: pointer;
}

/* ### ### ### 01 */
.b01_simple_rollover {
    color: #000000;
    border: #000000 solid 1px;
    padding: 10px;
    background-color: #ffffff;
}

.b01_simple_rollover:hover {
    color: #ffffff;
    background-color: #000000;
}

/* ### ### ### 02 */
.b02_slide_in {
    overflow: hidden;
    border: #000000 solid 1px;
}

.b02_slide_in div {
    position: absolute;
    text-align: center;
    width: 100%;
    height: 50px;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    padding: 10px;
}

.b02_slide_in div:nth-child(1) {
    color: #000000;
    background-color: #ffffff;
}

.b02_slide_in div:nth-child(2) {
    background-color: #000000;
    transition: top 0.1s ease;
    -webkit-transition: top 0.1s ease;
    -moz-transition: top 0.1s ease;
    top: -50px;
}

.b02_slide_in div:nth-child(3) {
    color: #ffffff;
    transition: opacity 0.1s ease;
    -webkit-transition: opacity 0.1s ease;
    -moz-transition: opacity 0.1s ease;
    opacity: 0;
}

.b02_slide_in:hover div:nth-child(2) {
    top: 0px;
    transition: top 0.1s ease;
    -webkit-transition: top 0.1s ease;
    -moz-transition: top 0.1s ease;
}

.b02_slide_in:hover div:nth-child(3) {
    opacity: 1;
    transition: opacity 0.1s ease;
    -webkit-transition: opacity 0.1s ease;
    -moz-transition: opacity 0.1s ease;
}

/* ### ### ### 03 */
.b03_skewed_slide_in {
    overflow: hidden;
    border: #000000 solid 1px;
}

.b03_skewed_slide_in div {
    position: absolute;
    text-align: center;
    width: 100%;
    height: 50px;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    padding: 10px;
}

.b03_skewed_slide_in div:nth-child(1) {
    color: #000000;
    background-color: #ffffff;
}

.b03_skewed_slide_in div:nth-child(2) {
    background-color: #000000;
    width: 230px;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: translate(-250px, 0px) skewX(-30deg);
    -webkit-transform: translate(-250px, 0px) skewX(-30deg);
    -moz-transform: translate(-250px, 0px) skewX(-30deg);
}

.b03_skewed_slide_in div:nth-child(3) {
    color: #ffffff;
    left: -200px;
    transition: left 0.2s ease;
    -webkit-transition: left 0.2s ease;
    -moz-transition: left 0.2s ease;
}

.b03_skewed_slide_in:hover div:nth-child(2) {
    transition: all 0.5s ease;
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    transform: translate(-15px, 0px) skewX(-30deg);
    -webkit-transform: translate(-15px, 0px) skewX(-30deg);
    -moz-transform: translate(-15px, 0px) skewX(-30deg);
}

.b03_skewed_slide_in:hover div:nth-child(3) {
    left: 0px;
    transition: left 0.30000000000000004s ease;
    -webkit-transition: left 0.30000000000000004s ease;
    -moz-transition: left 0.30000000000000004s ease;
}

/* ### ### ### 04 */
.b04_3d_tick {
    perspective: 500px;
    -webkit-perspective: 500px;
    -moz-perspective: 500px;
    perspective-origin: center top;
    -webkit-perspective-origin: center top;
    -moz-perspective-origin: center top;
}

.b04_3d_tick div {
    position: absolute;
    text-align: center;
    width: 100%;
    height: 50px;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    padding: 10px;
    border: #000000 solid 1px;
}

.b04_3d_tick div:nth-child(1) {
    color: #000000;
    background-color: #ffffff;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
}

.b04_3d_tick div:nth-child(2) {
    color: #ffffff;
    background-color: #000000;
    transform: rotateX(90deg);
    -webkit-transform: rotateX(90deg);
    -moz-transform: rotateX(90deg);
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform-origin: left top;
    -webkit-transform-origin: left top;
    -moz-transform-origin: left top;
}

.b04_3d_tick:hover div:nth-child(1) {
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    background-color: rgba(0, 0, 0, 0.5);
}

.b04_3d_tick:hover div:nth-child(2) {
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
}

/* ### ### ### 05 */
.b05_3d_roll {
    perspective: 500px;
    -webkit-perspective: 500px;
    -moz-perspective: 500px;
}

.b05_3d_roll div {
    position: absolute;
    text-align: center;
    width: 100%;
    height: 50px;
    padding: 10px;
    border: #000000 solid 1px;
    pointer-events: none;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
}

.b05_3d_roll div:nth-child(1) {
    color: #000000;
    background-color: #000000;
    transform: rotateX(90deg);
    -webkit-transform: rotateX(90deg);
    -moz-transform: rotateX(90deg);
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 50% 50% -25px;
    -moz-transform-origin: 50% 50% -25px;
}

.b05_3d_roll div:nth-child(2) {
    color: #000000;
    background-color: #ffffff;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 50% 50% -25px;
    -moz-transform-origin: 50% 50% -25px;
}

.b05_3d_roll:hover div:nth-child(1) {
    color: #ffffff;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
}

.b05_3d_roll:hover div:nth-child(2) {
    background-color: #000000;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(-90deg);
    -webkit-transform: rotateX(-90deg);
    -moz-transform: rotateX(-90deg);
}

/* ### ### ### 06 */
.b06_3d_swap {
    perspective: 500px;
    -webkit-perspective: 500px;
    -moz-perspective: 500px;
    transform-style: preserve-3d;
    -webkit-transform-style: preserve-3d;
}

.b06_3d_swap div {
    position: absolute;
    text-align: center;
    width: 100%;
    height: 50px;
    padding: 10px;
    border: #000000 solid 1px;
    pointer-events: none;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
}

.b06_3d_swap div:nth-child(1) {
    color: #000000;
    background-color: #ffffff;
    transform: translateZ(0px);
    -webkit-transform: translateZ(0px);
    -moz-transform: translateZ(0px);
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 50% 50% -25px;
    -moz-transform-origin: 50% 50% -25px;
}

.b06_3d_swap div:nth-child(2) {
    color: #ffffff;
    background-color: #000000;
    transform: rotateX(90deg);
    -webkit-transform: rotateX(90deg);
    -moz-transform: rotateX(90deg);
    transition: all 0.2s ease 0.05s;
    -webkit-transition: all 0.2s ease 0.05s;
    -moz-transition: all 0.2s ease 0.05s;
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 50% 50% -25px;
    -moz-transform-origin: 50% 50% -25px;
}

.b06_3d_swap:hover div:nth-child(1) {
    color: #000000;
    background-color: #808080;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: translateZ(-200px);
    -webkit-transform: translateZ(-200px);
    -moz-transform: translateZ(-200px);
}

.b06_3d_swap:hover div:nth-child(2) {
    color: #ffffff;
    transition: all 0.2s ease 0.05s;
    -webkit-transition: all 0.2s ease 0.05s;
    -moz-transition: all 0.2s ease 0.05s;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
}

/* ### ### ### 07 */
.b07_3d_double_roll {
    perspective: 500px;
    -webkit-perspective: 500px;
    -moz-perspective: 500px;
    transform-style: preserve-3d;
    -webkit-transform-style: preserve-3d;
}

.b07_3d_double_roll div {
    position: absolute;
    text-align: center;
    padding: 10px;
    border: #000000 solid 1px;
    pointer-events: none;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
}

.b07_3d_double_roll div:nth-child(1) {
    color: #000000;
    background-color: #ffffff;
    z-index: 0;
    width: 100%;
    height: 50px;
    clip: rect(0px, 100px, 50px, 0px);
    position: absolute;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 50% 50% -25px;
    -moz-transform-origin: 50% 50% -25px;
}

.b07_3d_double_roll div:nth-child(2) {
    color: #000000;
    background-color: #000000;
    z-index: -1;
    width: 100%;
    height: 50px;
    clip: rect(0px, 100px, 50px, 0px);
    position: absolute;
    transform: rotateX(90deg);
    -webkit-transform: rotateX(90deg);
    -moz-transform: rotateX(90deg);
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 50% 50% -25px;
    -moz-transform-origin: 50% 50% -25px;
}

.b07_3d_double_roll div:nth-child(3) {
    color: #000000;
    background-color: #ffffff;
    z-index: 0;
    width: 100%;
    height: 50px;
    clip: rect(0px, 200px, 50px, 100px);
    position: absolute;
    transition: all 0.2s ease 0.1s;
    -webkit-transition: all 0.2s ease 0.1s;
    -moz-transition: all 0.2s ease 0.1s;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 50% 50% -25px;
    -moz-transform-origin: 50% 50% -25px;
}

.b07_3d_double_roll div:nth-child(4) {
    color: #000000;
    background-color: #000000;
    z-index: -1;
    width: 100%;
    height: 50px;
    clip: rect(0px, 200px, 50px, 100px);
    position: absolute;
    transform: rotateX(-90deg);
    -webkit-transform: rotateX(-90deg);
    -moz-transform: rotateX(-90deg);
    transition: all 0.2s ease 0.1s;
    -webkit-transition: all 0.2s ease 0.1s;
    -moz-transition: all 0.2s ease 0.1s;
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 50% 50% -25px;
    -moz-transform-origin: 50% 50% -25px;
}

.b07_3d_double_roll:hover div:nth-child(1) {
    background-color: #000000;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(-90deg);
    -webkit-transform: rotateX(-90deg);
    -moz-transform: rotateX(-90deg);
}

.b07_3d_double_roll:hover div:nth-child(2) {
    color: #ffffff;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
}

.b07_3d_double_roll:hover div:nth-child(3) {
    background-color: #000000;
    transition: all 0.2s ease 0.1s;
    -webkit-transition: all 0.2s ease 0.1s;
    -moz-transition: all 0.2s ease 0.1s;
    transform: rotateX(90deg);
    -webkit-transform: rotateX(90deg);
    -moz-transform: rotateX(90deg);
}

.b07_3d_double_roll:hover div:nth-child(4) {
    color: #ffffff;
    transition: all 0.2s ease 0.1s;
    -webkit-transition: all 0.2s ease 0.1s;
    -moz-transition: all 0.2s ease 0.1s;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
}

/* ### ### ### 08 */
.b08_3d_pushback {
    perspective: 500px;
    -webkit-perspective: 500px;
    -moz-perspective: 500px;
    transform-style: preserve-3d;
    -webkit-transform-style: preserve-3d;
}

.b08_3d_pushback div {
    position: absolute;
    text-align: center;
    width: 100%;
    height: 50px;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    pointer-events: none;
    padding: 10px;
    border: #000000 solid 1px;
}

.b08_3d_pushback div:nth-child(1) {
    color: #000000;
    background-color: #ffffff;
    transform: rotateX(0deg) translateZ(0px);
    -webkit-transform: rotateX(0deg) translateZ(0px);
    -moz-transform: rotateX(0deg) translateZ(0px);
    transform-origin: 50% 50%;
    -webkit-transform-origin: 50% 50%;
    -moz-transform-origin: 50% 50%;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
}

.b08_3d_pushback div:nth-child(2) {
    color: #ffffff;
    background-color: #000000;
    transform: rotateX(-179.5deg) translateZ(1px);
    -webkit-transform: rotateX(-179.5deg) translateZ(1px);
    -moz-transform: rotateX(-179.5deg) translateZ(1px);
    transform-origin: 50% 50%;
    -webkit-transform-origin: 50% 50%;
    -moz-transform-origin: 50% 50%;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
}

.b08_3d_pushback:hover div:nth-child(1) {
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(179.5deg);
    -webkit-transform: rotateX(179.5deg);
    -moz-transform: rotateX(179.5deg);
}

.b08_3d_pushback:hover div:nth-child(2) {
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(0deg) rotateY(0deg) translateZ(1px);
    -webkit-transform: rotateX(0deg) rotateY(0deg) translateZ(1px);
    -moz-transform: rotateX(0deg) rotateY(0deg) translateZ(1px);
}

/* ### ### ### 09 */
.b09_electric {
    color: #000000;
    background-color: #ffffff;
    border: #000000 solid 1px;
    padding: 10px;
    transition: all 0.1s ease;
    -webkit-transition: all 0.1s ease;
    -moz-transition: all 0.1s ease;
}

.b09_electric:hover {
    color: #ffffff;
    background-color: #000000;
    animation: b09_electric_blinkIn 0.1s step-end 0 2;
    -webkit-animation: b09_electric_blinkIn 0.1s step-end 0 2;
    -moz-animation: b09_electric_blinkIn 0.1s step-end 0 2;
    transition: all 0.2s ease 0.2s;
    -webkit-transition: all 0.2s ease 0.2s;
    -moz-transition: all 0.2s ease 0.2s;
}

@-webkit-keyframes b09_electric_blinkIn {
    from,
    to {
        background-color: #f8f8f8;
        color: #080808;
    }
    50% {
        background-color: #ffffff;
        color: #000000;
    }
}

@-moz-keyframes b09_electric_blinkIn {
    from,
    to {
        background-color: #f8f8f8;
        color: #080808;
    }
    50% {
        background-color: #ffffff;
        color: #000000;
    }
}

/* ### ### ### 10 */
/* ### ### ### 10 ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### */
.b10_tveffect div {
    position: absolute;
    text-align: center;
    width: 100%;
    height: 50px;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
}

.b10_tveffect div:nth-child(1) {
    color: #000000;
    background-color: #ffffff;
    -webkit-transition: all 0.1s ease;
    padding: 10px;
    border: #000000 solid 1px;
}

.b10_tveffect div:nth-child(2) {
    overflow: hidden;
}

.b10_tveffect div:nth-child(2) div {
    position: absolute;
    text-align: center;
    width: 100%;
    height: 50px;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    padding: 10px;
    border: #000000 hidden 1px;
}

.b10_tveffect div:nth-child(2) div:nth-child(1) {
    color: rgba(200, 120, 120, 0.8);
    opacity: 0;
    background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAGCAYAAAAL+1RLAAAAF0lEQVQIW2NkwAIYgWKS6OIgQQxAoUoAE4AAUnD/0ugAAAAASUVORK5CYII=) repeat;
}

.b10_tveffect div:nth-child(2) div:nth-child(2) {
    color: rgba(120, 200, 120, 0.8);
    opacity: 0;
    background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAGCAYAAAAL+1RLAAAAF0lEQVQIW2NkwAIYgWKS6OIgQQxAoUoAE4AAUnD/0ugAAAAASUVORK5CYII=) repeat;
}

.b10_tveffect div:nth-child(2) div:nth-child(3) {
    color: rgba(120, 120, 200, 0.8);
    opacity: 0;
    background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAGCAYAAAAL+1RLAAAAF0lEQVQIW2NkwAIYgWKS6OIgQQxAoUoAE4AAUnD/0ugAAAAASUVORK5CYII=) repeat;
}

.b10_tveffect:hover div:nth-child(1) {
    color: #ffffff;
    background-color: #000000;
    transition: color 0s ease;
    -webkit-transition: color 0s ease;
    -moz-transition: color 0s ease;
    transition: background-color 0.3s ease 0.2s;
    -webkit-transition: background-color 0.3s ease 0.2s;
    -moz-transition: background-color 0.3s ease 0.2s;
}

.b10_tveffect:hover div:nth-child(2) div:nth-child(1) {
    animation: b10_tveffect_red 0.25s linear;
    -webkit-animation: b10_tveffect_red 0.25s linear;
    -moz-animation: b10_tveffect_red 0.25s linear;
}

.b10_tveffect:hover div:nth-child(2) div:nth-child(2) {
    animation: b10_tveffect_green 0.25s linear;
    -webkit-animation: b10_tveffect_green 0.25s linear;
    -moz-animation: b10_tveffect_green 0.25s linear;
}

.b10_tveffect:hover div:nth-child(2) div:nth-child(3) {
    animation: b10_tveffect_blue 0.25s linear;
    -webkit-animation: b10_tveffect_blue 0.25s linear;
    -moz-animation: b10_tveffect_blue 0.25s linear;
}

@-webkit-keyframes b10_tveffect_red {
    from,
    to {
        opacity: 0;
    }
    25% {
        opacity: 1;
        -webkit-transform: scale(1.8, 1.6) translate(-10px, 3px) skewX(30deg);
    }
    50% {
        opacity: 1;
        -webkit-transform: scale(1.5, 1.2) translate(20px, 6px) skewX(5deg);
    }
    75% {
        opacity: 1;
        -webkit-transform: scale(0.9, 1.8) translate(-16px, -1px) skewX(-20deg);
    }
}

@-webkit-keyframes b10_tveffect_green {
    from,
    to {
        opacity: 0;
    }
    25% {
        opacity: 1;
        -webkit-transform: scale(1.3, 1.5) translate(3px, 6px) skewX(25deg);
    }
    50% {
        opacity: 1;
        -webkit-transform: scale(1.6, 1.1) translate(-16px, -5px) skewX(-15deg);
    }
    75% {
        opacity: 1;
        -webkit-transform: scale(1, 1.8) translate(18px, 4px) skewX(15deg);
    }
}

@-webkit-keyframes b10_tveffect_blue {
    from,
    to {
        opacity: 0;
    }
    25% {
        opacity: 1;
        -webkit-transform: scale(1.2, 1.4) translate(-10px, -3px) skewX(-25deg);
    }
    50% {
        opacity: 1;
        -webkit-transform: scale(1.9, 1.1) translate(16px, 3px) skewX(5deg);
    }
    75% {
        opacity: 1;
        -webkit-transform: scale(1.3, 2) translate(-30px, -3px) skewX(20deg);
    }
}

@-moz-keyframes b10_tveffect_red {
    from,
    to {
        opacity: 0;
    }
    25% {
        opacity: 1;
        transform: scale(1.8, 1.6) translate(-10px, 3px) skewX(30deg);
    }
    50% {
        opacity: 1;
        transform: scale(1.5, 1.2) translate(20px, 6px) skewX(5deg);
    }
    75% {
        opacity: 1;
        transform: scale(0.9, 1.8) translate(-16px, -1px) skewX(-20deg);
    }
}

@-moz-keyframes b10_tveffect_green {
    from,
    to {
        opacity: 0;
    }
    25% {
        opacity: 1;
        transform: scale(1.3, 1.5) translate(3px, 6px) skewX(25deg);
    }
    50% {
        opacity: 1;
        transform: scale(1.6, 1.1) translate(-16px, -5px) skewX(-15deg);
    }
    75% {
        opacity: 1;
        transform: scale(1, 1.8) translate(18px, 4px) skewX(15deg);
    }
}

@-moz-keyframes b10_tveffect_blue {
    from,
    to {
        opacity: 0;
    }
    25% {
        opacity: 1;
        transform: scale(1.2, 1.4) translate(-10px, -3px) skewX(-25deg);
    }
    50% {
        opacity: 1;
        transform: scale(1.9, 1.1) translate(16px, 3px) skewX(5deg);
    }
    75% {
        opacity: 1;
        transform: scale(1.3, 2) translate(-30px, -3px) skewX(20deg);
    }
}

/* ### ### ### 11 */
.b11_3d_jumpback {
    perspective: 500px;
    -webkit-perspective: 500px;
    -moz-perspective: 500px;
}

.b11_3d_jumpback div {
    color: #000000;
    background-color: #ffffff;
    border: #000000 solid 1px;
    padding: 10px;
    position: absolute;
    width: 100%;
    height: 100%;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
}

.b11_3d_jumpback:hover div {
    color: #ffffff;
    background-color: #000000;
    animation: b11_3d_jump 0.3s ease-out;
    -webkit-animation: b11_3d_jump 0.3s ease-out;
    -moz-animation: b11_3d_jump 0.3s ease-out;
    animation-fill-mode: forwards;
    -webkit-animation-fill-mode: forwards;
    -moz-animation-fill-mode: forwards;
}

@-webkit-keyframes b11_3d_jump {
    from {
        transform: translateZ(0px) rotateX(0deg);
        -webkit-transform: translateZ(0px) rotateX(0deg);
        -moz-transform: translateZ(0px) rotateX(0deg);
        background-color: #ffffff;
        color: #000000;
    }
    49.99% {
        transform: translateZ(100px) rotateX(90deg);
        -webkit-transform: translateZ(100px) rotateX(90deg);
        -moz-transform: translateZ(100px) rotateX(90deg);
        background-color: #808080;
        color: #000000;
    }
    50.00% {
        transform: translateZ(100px) rotateX(-90deg);
        -webkit-transform: translateZ(100px) rotateX(-90deg);
        -moz-transform: translateZ(100px) rotateX(-90deg);
        background-color: #000000;
        color: #808080;
    }
    to {
        transform: translateZ(0px) rotateX(0deg);
        -webkit-transform: translateZ(0px) rotateX(0deg);
        -moz-transform: translateZ(0px) rotateX(0deg);
        background-color: #000000;
        color: #ffffff;
    }
}

@-moz-keyframes b11_3d_jump {
    from {
        transform: translateZ(0px) rotateX(0deg);
        -webkit-transform: translateZ(0px) rotateX(0deg);
        -moz-transform: translateZ(0px) rotateX(0deg);
        background-color: #ffffff;
        color: #000000;
    }
    49.99% {
        transform: translateZ(100px) rotateX(90deg);
        -webkit-transform: translateZ(100px) rotateX(90deg);
        -moz-transform: translateZ(100px) rotateX(90deg);
        background-color: #808080;
        color: #000000;
    }
    50.00% {
        transform: translateZ(100px) rotateX(-90deg);
        -webkit-transform: translateZ(100px) rotateX(-90deg);
        -moz-transform: translateZ(100px) rotateX(-90deg);
        background-color: #000000;
        color: #808080;
    }
    to {
        transform: translateZ(0px) rotateX(0deg);
        -webkit-transform: translateZ(0px) rotateX(0deg);
        -moz-transform: translateZ(0px) rotateX(0deg);
        background-color: #000000;
        color: #ffffff;
    }
}

/* ### ### ### 12 */
.b12_3d_glitch {
    overflow: hidden;
    width: 200px;
    height: 51px;
}

.b12_3d_glitch div {
    padding: 10px;
    position: absolute;
    text-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    width: 200px;
    height: 50px;
}

.b12_3d_glitch div:nth-child(1) {
    background-color: #ffffff;
    top: 1px;
    left: 0px;
    border: #000000 solid 1px;
}

.b12_3d_glitch div:nth-child(2) {
    color: #000000;
    left: -100px;
    top: 2px;
    width: 400px;
    height: 50px;
}

.b12_3d_glitch:hover div:nth-child(1) {
    animation: b12_3d_glitch_bg 0.3s linear;
    -webkit-animation: b12_3d_glitch_bg 0.3s linear;
    -moz-animation: b12_3d_glitch_bg 0.3s linear;
    animation-fill-mode: forwards;
    -webkit-animation-fill-mode: forwards;
    -moz-animation-fill-mode: forwards;
}

.b12_3d_glitch:hover div:nth-child(2) {
    color: #000000;
    animation: b12_3d_glitch 0.3s linear;
    -webkit-animation: b12_3d_glitch 0.3s linear;
    -moz-animation: b12_3d_glitch 0.3s linear;
    animation-fill-mode: forwards;
    -webkit-animation-fill-mode: forwards;
    -moz-animation-fill-mode: forwards;
    background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAGCAYAAAAL+1RLAAAAF0lEQVQIW2NkwAIYgWKS6OIgQQxAoUoAE4AAUnD/0ugAAAAASUVORK5CYII=) repeat;
}

@-webkit-keyframes b12_3d_glitch_bg {
    49.00% {
        background-color: #ffffff;
    }
    50.00% {
        background-color: #000000;
    }
    to {
        background-color: #000000;
    }
}

@-webkit-keyframes b12_3d_glitch {
    from {
        transform: skewX(0deg);
        -webkit-transform: skewX(0deg);
        -moz-transform: skewX(0deg);
        color: #000000;
    }
    25.00% {
        transform: skewX(80deg);
        -webkit-transform: skewX(80deg);
        -moz-transform: skewX(80deg);
        color: #000000;
    }
    75.00% {
        transform: skewX(-20deg);
        -webkit-transform: skewX(-20deg);
        -moz-transform: skewX(-20deg);
        color: #ffffff;
    }
    90.00% {
        transform: skewX(0deg);
        -webkit-transform: skewX(0deg);
        -moz-transform: skewX(0deg);
        color: #ffffff;
    }
    to {
        transform: skewX(0deg);
        -webkit-transform: skewX(0deg);
        -moz-transform: skewX(0deg);
        color: #ffffff;
    }
}

@-moz-keyframes b12_3d_glitch_bg {
    49.00% {
        background-color: #ffffff;
    }
    50.00% {
        background-color: #000000;
    }
    to {
        background-color: #000000;
    }
}

@-moz-keyframes b12_3d_glitch {
    from {
        transform: skewX(0deg);
        -webkit-transform: skewX(0deg);
        -moz-transform: skewX(0deg);
        color: #000000;
    }
    25.00% {
        transform: skewX(80deg);
        -webkit-transform: skewX(80deg);
        -moz-transform: skewX(80deg);
        color: #000000;
    }
    75.00% {
        transform: skewX(-20deg);
        -webkit-transform: skewX(-20deg);
        -moz-transform: skewX(-20deg);
        color: #ffffff;
    }
    90.00% {
        transform: skewX(0deg);
        -webkit-transform: skewX(0deg);
        -moz-transform: skewX(0deg);
        color: #ffffff;
    }
    to {
        transform: skewX(0deg);
        -webkit-transform: skewX(0deg);
        -moz-transform: skewX(0deg);
        color: #ffffff;
    }
}
</style>
</head>
<body>
<div class="back">
    <div class="button_base b02_slide_in">
        <div>01_Button</div>
        <div></div>
        <div>01_Button</div>
    </div>
</div>
</body>
</html>