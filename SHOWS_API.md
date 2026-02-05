# Shows API

Public API hosted on online.equipe.com. No authentication required.

This endpoint allows organizers to integrate their show calendar into their own website by fetching the JSON and rendering it however they like. The response combines shows from both online.equipe.com (results, live scoring) and entry.equipe.com (entries, registration) into a single list.

## Finding your organizer URL

1. Sign in to online.equipe.com from app.equipe.com
2. Go to one of your shows, then **Admin > Organizer**
3. Check the address bar — it will look something like `https://online.equipe.com/organizers/1683/course_designers`
4. Replace the path after the organizer ID with `/shows.json?from=YYYY-MM-DD&to=YYYY-MM-DD`, e.g. `https://online.equipe.com/organizers/1683/shows.json?from=2026-01-01&to=2026-12-31`

## List shows for an organizer

Returns shows within a date range, combining data from both online.equipe.com and entry.equipe.com. Shows are sorted by `starts_on` descending.

Required query parameters: `from` and `to` (YYYY-MM-DD). Returns 400 if missing.

Responses are cached for 4 hours per organizer + date range. ETag headers are included, so clients sending `If-None-Match` get 304 Not Modified when nothing has changed.

```http
GET https://online.equipe.com/organizers/{{organizer_id}}/shows?from=2026-01-01&to=2026-12-31

[
  {
    "identifier": "abc123",
    "name": "Show Name",
    "starts_on": "2026-02-17",
    "ends_on": "2026-02-17",
    "logo_url": "https://logo.equipeassets.com/logos/...",
    "online_url": "https://online.equipe.com/shows/84763",
    "entry_url": "https://entry.equipe.com/meetings/501",
    "entry_open_from": "2026-02-01T00:00:00+01:00",
    "entry_open_until": "2026-02-15T23:59:59+01:00"
  }
]
```

| Field | Type | Description |
|-------|------|-------------|
| identifier | string | Shared identifier between online and entry systems |
| name | string | Show name |
| starts_on | string | Start date (YYYY-MM-DD) |
| ends_on | string | End date (YYYY-MM-DD) |
| logo_url | string \| null | Logo of the show |
| online_url | string \| null | URL to the show on online.equipe.com |
| entry_url | string \| null | URL to enter the show on entry.equipe.com |
| entry_open_from | string \| null | When entry opens (ISO 8601) |
| entry_open_until | string \| null | When entry closes (ISO 8601) |
