# Equipe Timekeeping Devices

This project demonstrates how to build a new driver for timekeeping devices using an HTML file that interfaces with timekeeping hardware and communicates with a parent window. You can build your own driver and submit it as a PR here, and we will include it in Equipe itself.

## Getting Started

To get started, you can use the provided examples and modify them to suit your needs. Below are some examples and links to their respective HTML files.

### Examples

- **Equipe Timekeeping Driver Debugger**: This is a tool to help you debug and test your timekeeping driver.
  [Equipe Timekeeping Driver Debugger](equipe_timekeeping_driver_debugger.html)

- **Simple Computer Clock Example**: This example uses the computer's clock as a timekeeping device.
  [Read more](computer.html)

- **FDS TBox System Support**: This example demonstrates support for the FDS TBox system.
  [Read more](fds.html)

## How to Build a Driver

1. **Create an HTML file**: Your HTML file should interface with the timekeeping hardware and communicate with the parent window using `postMessage`.

2. **Implement Required Events**: Your driver should implement the following events:
   - `runningTime`: Send this event every 1/10 seconds with the current running time.
   - `pulse`: Send this event every time a node is triggered.
   - `cmd`: Listen for this event to trigger a node manually.

3. **Test Your Driver**: Use the Equipe Timekeeping Driver Debugger to test your driver before submitting it.

## Submitting Your Driver

Once you have built and tested your driver, you can submit it as a pull request to this repository. Make sure to include any necessary documentation and instructions for using your driver.

## Additional Resources

- [Equipe API Documentation](https://github.com/equipe/equipe-api/blob/master/TIMEKEEPING_CLIENT.md#realtime-data)
- [Equipe Timekeeping Driver Debugger](equipe_timekeeping_driver_debugger.html)

Feel free to reach out if you have any questions or need further assistance.
