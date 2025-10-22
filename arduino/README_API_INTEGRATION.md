# Arduino Device Management - API Integration

## Overview
This Flutter app now integrates with your API to manage Arduino devices dynamically. The app fetches device information from the API and displays them in cards with all the details from your Swagger specification.

## API Integration Features

### Device Model
- **ID**: Unique device identifier
- **Name**: Device name (e.g., "Arduino Sala")
- **IP**: Device IP address (e.g., "192.168.1.100")
- **Created At**: Device creation timestamp

### API Endpoints Used
- `GET /devices` - Fetch all devices
- `POST /devices` - Create a new device

### App Features
1. **Dynamic Device Loading**: Fetches devices from your API on app startup
2. **Device Cards**: Displays all device information including ID and creation date
3. **Add New Devices**: Dialog to add new devices via the API
4. **Error Handling**: Proper error messages and retry functionality
5. **Loading States**: Shows loading indicators during API calls
6. **Refresh**: Pull-to-refresh functionality to reload devices

## Configuration

### API Base URL
The API base URL is configured in `lib/services/device_service.dart`:
```dart
static const String baseUrl = 'http://localhost:3000'; // Adjust as needed
```

**Important**: Update this URL to match your API server address.

### Common API URLs:
- Local development: `http://localhost:3000`
- Local network: `http://192.168.1.XXX:3000`
- Production: `https://your-api-domain.com`

## Usage

### Running the App
1. Make sure your API server is running
2. Update the `baseUrl` in `DeviceService` if needed
3. Run: `flutter pub get`
4. Run: `flutter run`

### App Behavior
- **On startup**: Automatically fetches devices from API
- **Empty state**: Shows message when no devices are found
- **Error state**: Shows error message with retry button
- **Add device**: Tap "Adicionar Dispositivo" to add new devices

### Error Scenarios
The app handles these error scenarios gracefully:
- API server not running
- Network connectivity issues
- Invalid API responses
- Server errors (4xx, 5xx)

## File Structure
```
lib/
├── models/
│   └── device.dart          # Device model and CreateDeviceRequest
├── services/
│   └── device_service.dart  # API service for device operations
├── widgets/
│   └── device_card.dart     # Updated device card widget
├── pages/
│   └── home_screen.dart     # Main screen with API integration
└── main.dart               # App entry point
```

## API Schema Compliance
The app is fully compliant with your Swagger specification:
- Uses exact field names and types
- Handles required fields properly
- Follows the API response format
- Implements proper error handling