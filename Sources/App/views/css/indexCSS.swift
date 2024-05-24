let indexCSS: StaticString = """
body {
 color: white;
 background-color:black;
 background-repeat: no-repeat;
 background-size:cover;
 font-family: -apple-system, BlinkMacSystemFont, segoe ui, Roboto, helvetica neue, Helvetica, Arial, sans-serif, apple color emoji, segoe ui emoji, segoe ui symbol;
 line-height: 1.8;
 max-width: 1280px;
 -webkit-font-smoothing:antialiased;
}

a {
 color: #e1e8d0;
 font-family: sf pro text, -apple-system, BlinkMacSystemFont, segoe ui, Roboto, helvetica neue, Helvetica, Arial, sans-serif, apple color emoji, segoe ui emoji, segoe ui symbol;
 font-weight: 600;
 text-decoration:none;
}

a:hover {
 color:#00b100
}

.greeting {
 font-size: 4rem;
 margin-bottom:.1em
}

h1 {
 font-family: sf pro display, -apple-system, BlinkMacSystemFont, segoe ui, Roboto, helvetica neue, Helvetica, Arial, sans-serif, apple color emoji, segoe ui emoji, segoe ui symbol;
 margin:1em 0
}

h1 {
 font-size:2.5em
}

header {
 padding-top:6em
}

footer {
 font-size: 1rem;
 padding-top:4em;
 padding-bottom:6em
}

li {
 font-size: 1.125rem;
 font-weight: 400;
 margin-bottom:.125em
}

p {
 font-size: 1.4rem;
 font-weight: 400;
 margin: 1.5em 0;
 max-width:700px
}

header, main, footer {
 padding-left: 4em;
 padding-right: 4em
}

.work {
 display: flex;
 flex-wrap: wrap;
 list-style-type: none;
 margin: 0;
 padding:.25em 0
}

.work li {
 font-size: 1rem;
 margin: 0 1.5em 1.5em 0;
 width:90px
}

.work li img:hover {
 transform:scale(1.1)
}

.icon-ios {
 border-radius: 25%;
}

@media only screen and (max-width: 1000px) {
 .greeting {
 line-height: 1.1;
 }
 .work li {
 width: 70px;
 }
 footer {
 padding-bottom:2em
 }
 header {
 padding-top:2em
 }
}

@media only screen and (max-width: 800px) {
 header, main, footer {
 padding-left: 1.5em;
 padding-right:1.5em
 }
}
"""
