# REST Commands for Arqut Integration

This guide will help you add REST commands to your Home Assistant configuration to interact with the Arqut API.

## Prerequisites

- Home Assistant instance with `rest_command` integration enabled
- Arqut API credentials (API keys)
- Access to your `configuration.yaml` file

## Installation Steps

### 1. Add REST Commands to Configuration

Add the following REST commands to your `configuration.yaml` file:

```yaml
# REST Commands for Arqut Integration
rest_command:

  # Send Notification to Arqut App
  arqut_send_notification:
    url: "https://api.arqut.com/v1/notification/send"
    method: POST
    content_type: "application/json"
    headers:
      Authorization: !secret arqut_api_key
    payload: >-
      {% set recipients = to | default([]) %}
      {% set recipients = recipients if recipients is list else [recipients] %}
      {
        "to": {{ recipients | to_json }},
        "title": {{ title | to_json }},
        "body": {{ body | to_json }},
        "action": {{ action | default("") | to_json }},
        "data": {{ data | default({}) | to_json }}
      }

  # Create Arqut Edge Event Log
  # Arqut Edge will send notification to Mobile App
  arqut_edge_create_event:
    url: "http://homeassistant.local:3030/api/events"
    method: POST
    content_type: "application/json; charset=utf-8"
    headers:
      Authorization: !secret arqut_edge_api_key_ha
    payload: >-
      {
        "title": {{ title | to_json }},
        "description": {{ description | to_json }},
        "event_type": {{ event_type | default("event") | to_json }},
        "data": {{ data | to_json if data is defined else "null" }}
      }
```

### 2. Add API Keys to Secrets

Add your API keys to `secrets.yaml`:

```yaml
# Arqut API Keys
arqut_api_key: "Bearer YOUR_API_KEY_HERE"
arqut_edge_api_key_ha: "Bearer YOUR_EDGE_API_KEY_HERE"
```

> **⚠️ Important:** Replace `YOUR_API_KEY_HERE` and `YOUR_EDGE_API_KEY_HERE` with your actual API keys. They all can get from Arqut Edge UI settings.

### 3. Restart Home Assistant

After making these changes, restart Home Assistant for the REST commands to become available:

- **Option A:** Go to **Settings** → **System** → **Restart**
- **Option B:** Use the Developer Tools → **Check Configuration** → **Restart**

## Usage Examples

### Send Notification to Arqut App

```yaml
# Example automation action
action: rest_command.arqut_send_notification
data:
  to: ["user_id_1", "user_id_2"]  # Optional, defaults to your account
  title: "Motion Detected"
  body: "Motion was detected in the living room"
  action: "VIEW_EVENT"  # Optional
  data:  # Optional
    event_id: "12345"
    sensor: "living_room_motion"
```

### Create Arqut Edge Event Log

```yaml
# Example automation action
action: rest_command.arqut_edge_create_event
data:
  title: "Garage Door Opened"
  description: "The garage door was opened at 2:30 PM"
  event_type: "security"  # Optional, defaults to "event"
  data:  # Optional
    door_sensor: "garage_door"
    timestamp: "2024-01-15T14:30:00Z"
```

## Testing the Commands

You can test the REST commands using Home Assistant's Developer Tools:

1. Go to **Developer Tools** → **Services**
2. Search for `rest_command.arqut_send_notification` or `rest_command.arqut_edge_create_event`
3. Fill in the required data fields
4. Click **Call Service**

## Automation Examples

### Send Notification on Motion Detection

```yaml
alias: "Notify Arqut on Motion"
trigger:
  platform: state
  entity_id: binary_sensor.living_room_motion
  to: "on"
action:
  service: rest_command.arqut_send_notification
  data:
    title: "Motion Alert"
    body: "Motion detected in living room"
    to: ["user_id_1", "user_id_2"]
```

### Create Event on Door Opening

```yaml
alias: "Log Door Opening to Arqut"
trigger:
  platform: state
  entity_id: binary_sensor.front_door
  to: "on"
action:
  service: rest_command.arqut_edge_create_event
  data:
    title: "Front Door Opened"
    description: "Front door was opened"
    event_type: "access"
```

## Troubleshooting

### Command Not Found
- Ensure `rest_command:` is properly indented in `configuration.yaml`
- Verify Home Assistant has been restarted after changes

### Authentication Errors
- Check that API keys in `secrets.yaml` are correct
- Verify the key format includes "Bearer " prefix if required

### Connection Errors
- For Arqut Edge events, ensure the Edge service is running on port 3030
- Verify network connectivity between Home Assistant and the Edge service

## Support

For issues, feature requests, or questions, please open an issue on the [GitHub repository](https://github.com/tphan267/arqut-ha-addon).

## Additional Resources

- [Home Assistant REST Command Documentation](https://www.home-assistant.io/integrations/rest_command/)
- [Home Assistant Secrets Documentation](https://www.home-assistant.io/docs/configuration/secrets/)
