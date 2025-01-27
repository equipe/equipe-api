# Timekeeping Outputs

This directory contains various HTML files used for displaying real-time data for timekeeping and scoreboards. Each file serves a specific purpose and is designed to work with the timekeeping system to display relevant information.

## Files

### [Window](window.html)
This file displays a scoreboard with rider and horse information, as well as timekeeping data. It includes a connection status indicator to show if data is being received.

### [ICC18D](icc_18d.html)
This file is used for displaying data on an ICC 205 18D scoreboard. It includes options to connect and disconnect from a serial port, and allows toggling between different display modes (timekeeping, daytime, blank).

### [FDS_MLED](fds_mled.html)
This file is used for displaying data on an FDS MLED scoreboard. It includes options to connect and disconnect from a serial port, and allows toggling between different display modes (timekeeping, daytime, blank). It also includes an option to toggle the display of 1/10 second resolution.

### [DEBUG](debug.html)
This file is used for debugging purposes. It displays real-time data output in a simple format and includes a button to toggle fullscreen mode.

## How They Work

Each HTML file includes a combination of HTML, CSS, and JavaScript to render the data and handle real-time updates. The JavaScript code listens for messages from the timekeeping system and updates the display accordingly. The files also include styles to ensure the data is presented in a clear and visually appealing manner.

### Common Features
- **Connection Status**: Most files include a connection status indicator to show if data is being received.
- **Real-time Updates**: The JavaScript code listens for messages and updates the display in real-time.
- **Display Modes**: Some files include options to toggle between different display modes (e.g., timekeeping, daytime, blank).

### Usage
1. Open the HTML file in a web browser.
2. Ensure the timekeeping system is running and sending data.
3. Use the provided controls (e.g., connect/disconnect buttons, mode toggles) to interact with the display.
4. Go to result registration in Equipe.
5. Open timekeeping.
6. Click the output button with the dropdown and select "Add User Driver".
7. Fill in the form and press "Add".
