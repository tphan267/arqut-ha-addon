# Home Assistant Blueprints for Arqut

A collection of Home Assistant blueprints to integrate and enhance Arqut functionality.

## Available Blueprints

### 1. Create Arqut Event via MQTT

Create new Arqut events by sending MQTT messages when a sensor is triggered, with options for cooldown and time restrictions.

[![Open your Home Assistant instance and show the blueprint import dialog with a specific blueprint url](https://my.home-assistant.io/badges/blueprint_import.svg)](https://my.home-assistant.io/redirect/blueprint_import/?blueprint_url=https://github.com/tphan267/arqut-ha-addon/blob/main/blueprints/arqut-event-mqtt.yaml)

**Prerequisite:**
- MQTT broker (Mosquitto from HA App Store)
- Configure MQTT client for Arqut Edge (Settings / MQTT Client)

**Features:**
- Create Arqut events via MQTT messages
- Configurable cooldown period to prevent event spam
- Time restriction options (e.g., only during specific hours)
- Trigger based on sensor states
- Send notification to owner & shared users

### 2. Create Arqut Event via Rest_command

Create new Arqut events by calling `rest_command` when a sensor is triggered, with options for cooldown and time restrictions.

[![Open your Home Assistant instance and show the blueprint import dialog with a specific blueprint url](https://my.home-assistant.io/badges/blueprint_import.svg)](https://my.home-assistant.io/redirect/blueprint_import/?blueprint_url=https://github.com/tphan267/arqut-ha-addon/blob/main/blueprints/arqut-event-rest_command.yaml)

**Prerequisite:**
- `rest_command.arqut_edge_create_event` must be configured

**Features:**
- Create Arqut events via MQTT messages
- Configurable cooldown period to prevent event spam
- Time restriction options (e.g., only during specific hours)
- Trigger based on sensor states
- Send notification to owner & shared users

### 3. Arqut Sensor Notification

Send notifications to multiple Arqut users when a sensor is triggered.

[![Open your Home Assistant instance and show the blueprint import dialog with a specific blueprint url](https://my.home-assistant.io/badges/blueprint_import.svg)](https://my.home-assistant.io/redirect/blueprint_import/?blueprint_url=https://github.com/tphan267/arqut-ha-addon/blob/main/blueprints/arqut-notification.yaml)

**Prerequisite:**
- `rest_command.arqut_send_notification` must be configured

**Features:**
- Send instant notifications to multiple Arqut users
- Trigger on any sensor state change
- Customizable notification messages

## Installation

1. Click the **Import Blueprint** button above for the blueprint you want
2. Home Assistant will open and prompt you to confirm the import
3. Review the blueprint configuration
4. Click **Create Automation** to create a new automation from the blueprint

## Manual Installation

Alternatively, you can manually import the blueprint:

1. Navigate to **Settings** → **Automations & Scenes** → **Blueprints**
2. Click the **Import Blueprint** button
3. Paste the raw URL of the blueprint YAML file
4. Click **Import**

## Support

For issues, feature requests, or questions, please open an issue on the [GitHub repository](https://github.com/tphan267/arqut-ha-addon).
