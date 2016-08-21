import React, { Component } from 'react';
import ShowJumpingEvent from './ShowJumpingEvent'
import _ from 'lodash';


class Timekeeping extends Component {

  constructor(props) {
    super(props);

    this.onOpen = this.onOpen.bind(this);
    this.onClose = this.onClose.bind(this);
    this.updateTime = this.updateTime.bind(this);
    this.start = this.start.bind(this);
    this.stop = this.stop.bind(this);
    this.fixedTo = this.fixedTo.bind(this);
    this.output = this.output.bind(this);
    this.onMessage = this.onMessage.bind(this);

    this.state = {
      connected: false,
      time: null,
      previousTime: null,
      running: false,
      countDown: false,
      countDownDiff: null,
      countDownValue: null,
      waiting: false,
      faults: null,
      totalFaults: null,
      fenceFaults: null,
      timeFaults: null,
      timeAdded: null,
      id: null,
      startNo: null,
      rider: null,
      horse: null,
      round: 1,
      phase: 1,
      timeToBeatDiff: null,
      timeToBeatTime: null,
      timekeepingOutputId: null
    };
  }

  componentDidMount(){
    this.webSocket = new WebSocket(this.props.url);
    this.webSocket.onopen = this.onOpen;
    this.webSocket.onclose = this.onClose;
    this.webSocket.onmessage = this.onMessage;
  }

  componentWillUnmount(){
    this.webSocket.close();
    this.webSocket = null;
  }

  onOpen(){
    this.setState({ connected: true });
  }

  onClose(){
    this.setState({ connected: false });
  }

  onMessage(event){
    let data = JSON.parse(event.data);
    if(data.type === 'output')
      this.output(data.payload);
  }

  output(data){
    console.log(data);

    // If eliminated hide the clock
    data.isEliminated = !!ShowJumpingEvent[data.fenceFaults];

    // Normalize
    data.faults = data.faults || 0;
    if(!data.timeAdded)
      data.timeAdded = null;

    if(data.countDownValue)
      data.countDownValue = parseFloat(data.countDownValue, 10);

    if (data.countDown && !data.running)
      this.start(Date.now() - (data.countDownValue * 1000));
    else
      if(data.running)
        this.start(Date.now() - (parseFloat(data.time, 10) * 1000));
      else {
        if(this.state.countDown && !data.countDown)
          data.countDown = true;

        data.time = this.fixedTo(parseFloat(data.time, 10) || 0, 2);
        data.countDownValue = this.fixedTo(parseFloat(data.countDownValue, 10), 2);
        this.stop();
      }

    this.setState(data);
  }

  fixedTo(number, digits) {
    if(_.isFinite(number)){
      var k = Math.pow(10, digits);
      var value = Math.round(number * k) / k;
      return value.toFixed(digits);
    } else {
      return null;
    }
  }

  updateTime(){
    var t = (Date.now() - this.startTick) / 1000;
    if(this.state.countDown)
      this.setState({ countDownValue: this.fixedTo(t, 1) });
    else
      if(this.state.running)
        this.setState({ time: this.fixedTo(t, 1) });
  }

  start(tick) {
    this.startTick = tick;
    if(!this.timer)
      this.timer = setInterval(this.updateTime, 100);
  }

  stop() {
    clearInterval(this.timer);
    this.timer = null;
  }

  render() {
    return (
      <div>
        <span>{this.state.connected ? 'connected' : 'disconnected'}</span>
        <h1>Start no: {this.state.startNo} ({this.state.id})</h1>
        <h1>Rider: {this.state.rider}</h1>
        <h2>Horse: {this.state.horse}</h2>
        <h3>Time: {this.state.time}</h3>
        <h3>Faults: {this.state.faults}</h3>
        <h4>countDown: {this.state.countDownValue}</h4>
        <h4>Rank: {this.state.rank}</h4>
      </div>
    );
  }
}

Timekeeping.propTypes = { url: React.PropTypes.string.isRequired };
Timekeeping.defaultProps = { url: 'ws://localhost:21000' };

export default Timekeeping;
