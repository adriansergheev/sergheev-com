import Foundation
import HtmlVaporSupport

struct Scenario {
  struct Image {
    let src: String
    let alt: String
    let credit: String
    let creditURL: String
  }

  struct Option {
    let label: String
    var detail: String? = nil
    // what humanity chose
    var correct = false
  }

  struct Reveal {
    let verdict: String
    let body: Node
    var source: String? = nil
  }

  let year: Int
  let objection: String
  let image: Image
  let story: [String]
  let question: String
  let options: [Option]
  let reveal: Reveal
}

extension Scenario {
  var slideID: String { "s\(year)" }
  var inputName: String { "q\(year)" }
}

func scenarios() -> [Scenario] {
  [
    Scenario(
      year: 1848,
      objection: "The “unnatural” objection",
      image: .init(
        src: "https://commons.wikimedia.org/wiki/Special:FilePath/The_discovery_of_the_anaesthetic_properties_of_chloroform._Wellcome_M0003394.jpg?width=1000",
        alt: "Diorama of James Young Simpson and two friends discovering the anaesthetic properties of chloroform",
        credit: "Wellcome Collection · CC BY 4.0",
        creditURL: "https://commons.wikimedia.org/wiki/File:The_discovery_of_the_anaesthetic_properties_of_chloroform._Wellcome_M0003394.jpg"
      ),
      story: [
        "It is 1848 and you are a physician. Chloroform arrived from Edinburgh last winter and its pain-relieving effects are widely known.",
        "On your ward there’s a woman in labour. Her pain is severe, though outside of that the labour is ordinary, or as one might say – natural. It is, as your professor puts it, physiological. The body doing precisely what bodies do. She screams for you to do something and help her!"
      ],
      question: "Do you administer chloroform?",
      options: [
        .init(label: "Yes,", detail: "she’s clearly in pain!", correct: true),
        .init(label: "No.", detail: "This is not a disease, nothing to treat here.")
      ],
      reveal: .init(
        verdict: "Humanity picked yes.",
        body: [
          .p("As we decided that we don’t want to keep pain around even though it is natural, why would we choose to keep dying of old age around on the premise that it is natural?")
        ]
      )
    ),
    Scenario(
      year: 1944,
      objection: "The decrepitude objection",
      image: .init(
        src: "https://commons.wikimedia.org/wiki/Special:FilePath/WPA_Pneumonia_Poster.jpg?width=1000",
        alt: "1936 poster of a shark, reading “Pneumonia strikes like a man eating shark led by its pilot fish the common cold”",
        credit: "Library of Congress · Public domain",
        creditURL: "https://commons.wikimedia.org/wiki/File:WPA_Pneumonia_Poster.jpg"
      ),
      story: [
        "It is 1944 and you’re in the hospital. Penicillin was relatively recently discovered and you just received a fresh batch.",
        "In a bed you have M., who is 72 and does not recognise her daughter anymore. Now she has pneumonia, the “friend of the aged” as it was known, and a very common cause of death for the old and frail."
      ],
      question: "Do you give her a dose?",
      options: [
        .init(label: "Yes,", detail: "she’s still alive!", correct: true),
        .init(label: "No,", detail: "I’d be extending her decline, she might as well go now.")
      ],
      reveal: .init(
        verdict: "Humanity picked yes.",
        body: [
          .p("Nobody today argues that we should withhold antibiotics from the frail elderly (though one could argue that they should still have a choice to go if they choose to do so)."),
          .p("Furthermore, should we condemn the old and frail for being old and frail?")
        ]
      )
    ),
    Scenario(
      year: 1968,
      objection: "The overpopulation objection",
      image: .init(
        src: "https://commons.wikimedia.org/wiki/Special:FilePath/(Left)_face_of_a_man_suffering_from_smallpox;_(right)_vaccin_Wellcome_L0027419.jpg?width=1000",
        alt: "Print of a man’s face covered in smallpox spots beside an arm being vaccinated, captioned “Vacunese contra la viruela”",
        credit: "Wellcome Collection · CC BY 4.0",
        creditURL: "https://commons.wikimedia.org/wiki/File:(Left)_face_of_a_man_suffering_from_smallpox;_(right)_vaccin_Wellcome_L0027419.jpg"
      ),
      story: [
        "It is 1968 and you are an officer at the World Health Organization. The Population Bomb is a bestseller and the mood in certain intellectual circles is apocalyptic: mass famine in the 1970s is treated as a very real possibility.",
        "As an officer, you have decision power over what projects get funded in developing countries. One day that year a policy proposal arrives on your desk: a smallpox eradication campaign in a developing country."
      ],
      question: "Do you fund it?",
      options: [
        .init(label: "Yes", correct: true),
        .init(label: "No")
      ],
      reveal: .init(
        verdict: "Humanity picked yes again.",
        body: [
          .p(
            "Smallpox was eradicated in India by 1975",
            .a(
              attributes: [
                .class("cite"),
                .href("https://apps.lib.umich.edu/online-exhibits/exhibits/show/smallpox-eradication-india/indian-engages-pandemic"),
                .target(.blank),
                .rel(.init(rawValue: "noopener")),
                .ariaLabel("Source")
              ],
              "↗"
            ),
            " and by 1979 the Global Commission for the Certification of Smallpox Eradication declared that smallpox had been eradicated from the planet."
          ),
          .p("Even fewer people today think society should halt attempts to cure diseases such as smallpox because of fears of overpopulation. If cures for each of the human diseases are not only okay, but viewed as very desirable, then a cure for all of them must be too.")
        ]
      )
    ),
    Scenario(
      year: 1978,
      objection: "The “only the rich will have it” objection",
      image: .init(
        src: "https://commons.wikimedia.org/wiki/Special:FilePath/Handle_with_care_LCCN00652398.jpg?width=1000",
        alt: "1943 safe-driving poster of a steering wheel and a traffic light, with a luggage tag reading “Handle with care”",
        credit: "Library of Congress · Public domain",
        creditURL: "https://commons.wikimedia.org/wiki/File:Handle_with_care_LCCN00652398.jpg"
      ),
      story: [
        "It is 1978 and you are on the road safety board. Mercedes-Benz and Bosch have presented the first anti-lock braking system (ABS). It is a novel system which will help make cars a lot safer in adverse road conditions such as heavy rain and ice. It will definitely save lives!",
        "It is however available on one car only – the S-class. And it is expensive for the time, as much as an average worker’s salary in a month!",
        "A petition from a group of activists arrives on your desk with the cry: “Hold the launch until an ordinary family can have it, safety can’t be decided by income!”"
      ],
      question: "Do you let the activists have their way?",
      options: [
        .init(label: "Yes,", detail: "nobody gets it until everybody can."),
        .init(label: "No,", detail: "let the rich have it first.", correct: true)
      ],
      reveal: .init(
        verdict: "Humanity picked no.",
        body: [
          .p("Mercedes shipped it and within a few years it was an option across the whole Mercedes range."),
          .p("It turns out that charging a premium price and then using that money to drive innovation further in the long term drives down the price of the product itself. There is no reason why it would not work this way for treatments targeting aging.")
        ],
        source: "https://www.automotiveworld.com/news/world-premiere-in-1978-in-the-mercedes-benz-s-class-anti-lock-braking-system-40-years-old/"
      )
    )
  ]
  .sorted { $0.year < $1.year }
}

// Standalone page, it brings its own shell instead of `layout()`
// because the slides and the timeline own the whole viewport.
public func howLongPage() -> Node {
  let scenarios = scenarios()
  let slides: [Node] = scenarios.enumerated().map { index, scenario in
    slide(scenario, next: scenarios.dropFirst(index + 1).first)
  }
  return [
    .doctype,
    .html(
      attributes: [.lang(.en)],
      .head(
        .title("The case against curing aging (draft)"),
        .style(unsafe: String(describing: tokensCSS) + String(describing: howLongCSS) + scenarioCSS(scenarios)),
        .meta(viewport: .width(.deviceWidth), .initialScale(1), .fit(.cover)),
        fontsAndAnalytics()
      ),
      .body(
        .div(attributes: [.class("draft")], "Draft"),
        .main(
          .section(
            attributes: [.class("slide"), .id("intro"), .tabindex(-1)],
            .h1("The case against curing aging"),
            .p("* Tested by history"),
            .div(
              attributes: [.class("actions")],
              scenarios.first.map(nextLink) ?? []
            )
          ),
          .fragment(slides)
        ),
        timeline(scenarios)
      )
    )
  ]
}

private func slide(_ scenario: Scenario, next: Scenario?) -> Node {
  let questionID = "\(scenario.inputName)-label"
  let options: [Node] = scenario.options.enumerated().map { index, option in
    let id = "\(scenario.inputName)-\(index)"
    return [
      .input(attributes: [.type(.radio), .name(scenario.inputName), .id(id)]),
      .label(
        attributes: [.class(option.correct ? "opt correct" : "opt"), .for(id)],
        .span(attributes: [.class("opt-label")], .text(option.label)),
        option.detail.map { .span(attributes: [.class("opt-detail")], .text($0)) } ?? []
      )
    ]
  }
  return .section(
    attributes: [.class("slide"), .id(scenario.slideID), .tabindex(-1)],
    .h2(attributes: [.class("year")], .text("\(scenario.year)")),
    .figure(
      .init(
        .img(
          src: scenario.image.src,
          alt: scenario.image.alt,
          attributes: [.class("photo"), .init("loading", "lazy"), .init("decoding", "async")]
        )
      ),
      .figcaption(
        .a(
          attributes: [.href(scenario.image.creditURL), .target(.blank), .rel(.init(rawValue: "noopener"))],
          .text(scenario.image.credit)
        )
      )
    ),
    .fragment(scenario.story.map { .p(.text($0)) }),
    .p(attributes: [.class("question"), .id(questionID)], .text(scenario.question)),
    .div(
      attributes: [
        .class("options"),
        .role(.radiogroup),
        .ariaLabelledby(questionID)
      ],
      .fragment(options)
    ),
    .div(
      attributes: [.class("reveal")],
      .p(attributes: [.class("objection")], .text(scenario.objection)),
      .p(attributes: [.class("verdict")], .text(scenario.reveal.verdict)),
      scenario.reveal.body,
      scenario.reveal.source.map {
        .a(attributes: [.class("source"), .href($0), .target(.blank), .rel(.init(rawValue: "noopener"))], .text($0))
      } ?? []
    ),
    next.map { .div(attributes: [.class("after actions")], nextLink(to: $0)) } ?? []
  )
}

private func timeline(_ scenarios: [Scenario]) -> Node {
  let backLinks: [Node] = scenarios.enumerated().map { index, scenario in
    let previous = index == 0 ? "intro" : scenarios[index - 1].slideID
    return .a(
      attributes: [.class("back back-\(scenario.year)"), .href("#\(previous)"), .ariaLabel("Previous")],
      backArrow()
    )
  }
  let nodes: [Node] = scenarios.map { scenario in
    .a(
      attributes: [.class("tl-node tl-\(scenario.year)"), .href("#\(scenario.slideID)")],
      .text("\(scenario.year)")
    )
  }
  return .nav(
    attributes: [.class("timeline"), .ariaLabel("Timeline")],
    // shown on the intro, where there is nothing to go back to
    .span(attributes: [.class("back disabled"), .ariaHidden(true)], backArrow()),
    .fragment(backLinks),
    .div(
      attributes: [.class("track")],
      .div(attributes: [.class("rail")]),
      .div(attributes: [.class("fill")]),
      .fragment(nodes)
    )
  )
}

// Per-scenario rules: the timeline reacts to the slide in the URL hash
// and to answered questions through `:has()`, so each year needs its own selectors.
private func scenarioCSS(_ scenarios: [Scenario]) -> String {
  scenarios.enumerated().map { index, scenario in
    // nodes are spread evenly, the years are too far apart to sit at their true distance
    let position = String(format: "%.2f%%", (Double(index) + 0.5) / Double(scenarios.count) * 100)
    let current = "body:has(#\(scenario.slideID):target)"
    let answered = ":has([name=\"\(scenario.inputName)\"]:checked)"
    let node = ".tl-\(scenario.year)"
    return """
    \(node) { left: \(position); }
    \(current) .fill { width: \(position); }
    \(current) .back-\(scenario.year) { display: grid; }
    body\(answered) \(node) { background: var(--accent); border-color: var(--accent); color: var(--on-accent); }
    \(current) \(node) { border-color: var(--fg); transform: translate(-50%, -50%) scale(1.12); }
    \(current):not(\(answered)) \(node) { color: var(--fg); }

    """
  }.joined()
}

private func nextLink(to scenario: Scenario) -> Node {
  .a(
    attributes: [.class("next"), .href("#\(scenario.slideID)"), .ariaLabel("Next")],
    arrow(#"<path d="M5 12h14M13 6l6 6-6 6"/>"#)
  )
}

private func backArrow() -> Node {
  arrow(#"<path d="M15 5l-7 7 7 7"/>"#)
}

private func arrow(_ path: StaticString) -> Node {
  .svg(
    attributes: [
      .init("viewBox", "0 0 24 24"),
      .init("fill", "none"),
      .init("stroke", "currentColor"),
      .init("stroke-width", "2.5"),
      .init("stroke-linecap", "round"),
      .init("stroke-linejoin", "round")
    ],
    safe: path
  )
}
