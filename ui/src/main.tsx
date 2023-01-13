import React from 'react';
import ReactDOM from 'react-dom';
import { createStore } from 'redux';
import { App } from './app';
import { store } from './app/store';
import { Provider } from 'react-redux';
import './index.css';
import { Buffer as BufferPolyfill } from 'Buffer'
declare var Buffer: typeof BufferPolyfill;
// @ts-ignore
globalThis.Buffer = BufferPolyfill

// import { Buffer } from "buffer/";
// window.Buffer = Buffer;

ReactDOM.render(
  <React.StrictMode>
    <Provider store={store}>
      <App />
    </Provider>
  </React.StrictMode>,
  document.getElementById('app')
);
