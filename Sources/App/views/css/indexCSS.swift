let indexCSS: StaticString = """
        body,
        html {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #000;
            font-family: Arial, sans-serif;
            color: #e1e8d0;
        }

        .box {
            background-color: #000;
            color: #e1e8d0;
            width: 600px;
        }

        .box h1 {
            margin: 0;
            font-size: 24px;
        }

        .divider {
            height: 1px;
            background-color: #e1e8d0;
            margin: 20px 0;
        }

        .box p {
            margin: 10px 0 20px;
            line-height: 1.5;
        }

        .box a {
            display: block;
            padding: 6px 0px;
            text-decoration: none;
            color: #e1e8d0;
        }

        .box a.inline-link {
            display: inline;
            padding: 0;
            color: inherit;
            text-decoration: underline;
        }
"""
