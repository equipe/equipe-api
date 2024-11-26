# Scoreboard

You can control the graphics with Stream Deck for example using the REST API on Scoreboard.

## Prerequisites

The scene must have **identifier**

```json
{
  "identifier": "08760cee",
  "name": "Themeable (variants: default, medium, large, xlarge)",
  "style": {
    "width": 1920,
    "height": 1080,
    "lineHeight": 1.3,
    "fontSize": 36,
    "padding": 0,
    "position": "relative",
    "backgroundColor": "var(--theme-background-color)"
  }
  ...
}
```

The `08760cee` is just an example, can be anything, but must be uniq within the scoreboard scenes.

```bash
curl -X PATCH "https://app.equipe.com/meetings/meeting_id/scoreboards/scoreboard_id/scenes/08760cee" -H "Content-Type: application/json" -H "X-API-KEY: your-api-key" -d '{ "updates": {
  "@PresentationItem": {
    "className.$toggle.in": true
  }
}}'
```


The updates is the same you you can find under the scene source `"update:"`


```json
  "director": {
    "Presentation": {
      "Show": {
        "update": {
          "@PresentationItem": {
            "className.$toggle.in": true
          }
        }
      }
    }
  }
```

### Response

The update is pushed live to all devices that are rendering this scoreboard and scene.

```json
{
  "sceneIndex": 0,
  "update": {
    "@LiveBlock": {
      "fallback.$set": "current"
    },
    "@PresentationItem": {
      "className.$toggle.in": true
    }
  }
}
```
