import React, { FC } from 'react';

interface IHelpMenu {
  top: number;
  left: number;
}

export const HelpMenu: FC<IHelpMenu> = (props: IHelpMenu) => {

  const {top, left} = props;

  return(
    <div
      className="p-4 bg-white"
      style={{
        position:'absolute',
        top: top - 30,
        left: left,
        transform: 'translate(-100%, -100%)'
      }}
    >
    <p className="mb-4">to interact with radio, enter commands in chat</p>
      <p className="font-bold">!play https://www.youtube.com/watch?v=3vLHelBuTRM</p>
      <div className="ml-4 mb-4">
        <p>change the current song / video / livestream</p>
        <p>(youtube, soundcloud, twitch, vimeo, audio/video URLs)</p>
      </div>
    
      {/* <p className="font-bold">
      !set-time
      </p>
      <div className="ml-4 mb-4">

      <p>set the shared timestamp to your current timestamp</p>
      </div> */}
      {/* <p>
      -----------
      </p>
      <p className='italic mb-2'>
      OTHER COMMANDS:
      </p>

      <p className="font-bold">
      !time

      </p>
      <div className="ml-4 mb-4">

      <p>auto scrub to the shared timestamp</p>
      </div> */}
    </div>
  );
};
