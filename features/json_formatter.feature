Feature: JSON output formatter
  In order to get results as data
  As a developer
  Cucumber should be able to output JSON

  Scenario: one feature, one passing scenario, one failing scenario
    Given I am in json
    And the tmp directory is empty
    When I run cucumber --format json --out tmp/out.json features/one_passing_one_failing.feature
    Then it should fail with
      """
      """
    And "examples/json/tmp/out.json" should match "^\{\"features\":\["

  Scenario: one feature, one passing scenario, one failing scenario
    Given I am in json
    When I run cucumber --format json_pretty features/one_passing_one_failing.feature
    Then it should fail with
      """
      {
        "features": [
          {
            "file": "features/one_passing_one_failing.feature",
            "name": "One passing scenario, one failing scenario",
            "tags": [
              "@a"
            ],
            "elements": [
              {
                "tags": [
                  "@b"
                ],
                "name": "Passing",
                "file_colon_line": "features/one_passing_one_failing.feature:5",
                "steps": [
                  {
                    "status": "passed",
                    "name": "Given a passing scenario",
                    "file_colon_line": "features/step_definitions/steps.rb:1"
                  }
                ]
              },
              {
                "tags": [
                  "@c"
                ],
                "name": "Failing",
                "file_colon_line": "features/one_passing_one_failing.feature:9",
                "steps": [
                  {
                    "exception": {
                      "class": "RuntimeError",
                      "message": "",
                      "backtrace": [
                        "./features/step_definitions/steps.rb:6:in `/a failing scenario/'",
                        "features/one_passing_one_failing.feature:10:in `Given a failing scenario'"
                      ]
                    },
                    "status": "failed",
                    "name": "Given a failing scenario",
                    "file_colon_line": "features/step_definitions/steps.rb:5"
                  }
                ]
              }
            ]
          }
        ]
      }
      """
