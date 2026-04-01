# Assignment 2, Social Science Inquiry III (SOSC13300-S26)

Due Friday, April 3, 2026 at 3:00pm via Qualtrics

Create a targeted Qualtrics survey that explores the relationship between political identity and attitudes toward environmental policies.

## General requirements

- Between questions, include page breaks.
- Label each variable, and check how question responses are encoded. *Question encodings follow each response option in parentheses.*
- Implement the question logic for parts 3 and 4, below: ensure that only respondents with the specified political identities are prompted with the renewable energy support question.

## Include the following components

### 1. Survey introduction

Compose a brief introduction that explains the survey's objectives. Emphasize the anonymity and confidentiality of responses to encourage candid answers.

### 2. Basic demographic question

Record age with the question `Please select your age range` and the following encoded options:

1. `Under 18` (`U18`)
2. `18-24` (`18-24`)
3. `25-34` (`25-34`)
4. `35-44` (`35-44`)
5. `45-54` (`45-54`)
6. `55-64` (`55-64`)
7. `65+` (`65+`)

Variable name: `Demographics_Age`

### 3. Political identity question

Ask participants to identify their political orientation on a 7-point scale ranging from `Strongly Liberal` to `Strongly Conservative`.

Use the branching logic and question wording from the ANES 7-point scale:
https://electionstudies.org/wp-content/uploads/2018/03/20091208PartyID.pdf

Variable name: `Party_ID`

You will have several questions that contribute to this variable.

### 4. Question logic for renewable energy support

Following the political identity question, use logic to present a follow-up question to respondents who identify as `Not very strong Democrat` and `Not very strong Republican`.

Ask:
`To what extent do you support renewable energy initiatives?`

Response options:

1. `Strongly Oppose` (`1`)
2. `Somewhat Oppose` (`2`)
3. `Neutral` (`3`)
4. `Somewhat Support` (`4`)
5. `Strongly Support` (`5`)

Variable name: `RenewableEnergy_Support`

### 5. Treatment assignment

Create two separate blocks for different framing messages. Each respondent should receive only one.

`Negative_science`

> Human emissions of greenhouse gasses are the primary cause of rising average global temperatures. If humans continue to emit greenhouse gasses at current rates future temperatures will rise even higher. This has consequences. For example, climate change will raise sea levels as ice caps melt; higher temperatures will increase the damage to coastal ecosystems. The science is clear: unless we do something about climate change these ecosystems face dire consequences.

`Positive_science`

> Human emissions of greenhouse gasses are the primary cause of rising average global temperatures. If humans reduce emissions of greenhouse gasses below current rates future temperatures will be lower. This has consequences. For example, climate change will raise sea levels as ice caps melt; lower temperatures will reduce the damage to coastal ecosystems. The science is clear: we should do something about climate change to protect these ecosystems.

In the survey flow, use the Randomizer feature to assign respondents to one of these two messages with equal probability.

Create an embedded variable `Treatment_positive` that equals `0` for the negative framing and `1` for the positive framing.

### 6. Environmental policy priority question

Include a question about the priority level the respondent assigns to environmental policies. Use a 5-point Likert scale encoded numerically as follows:

1. `Not a Priority` (`1`)
2. `Low Priority` (`2`)
3. `Medium Priority` (`3`)
4. `High Priority` (`4`)
5. `Top Priority` (`5`)

Variable name: `EnvPolicy_Priority`

### 7. Completion message

Conclude with a short thank-you message that reinforces the value of the respondent's participation.

## Submission requirements

Add me to the survey as a collaborator. 
