let stylesheet: StaticString = """
		body, html {
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
			border: 1px solid #e1e8d0;
			padding: 40px;
			border-radius: 10px;
			text-align: center;
			width: 300px;
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
		}
		.box a {
			display: inline-block;
			padding: 10px 20px;
			border: 1px solid #e1e8d0;
			border-radius: 5px;
			text-decoration: none;
			color: #e1e8d0;
		}
		.link {
				margin-right: 10px;
		}
"""
