import React, { FC } from 'react';

interface IHelpMenu {
  top: number;
  left: number;
}

export const HelpMenu: FC<IHelpMenu> = (props: IHelpMenu) => {

  const {top, left} = props;

  const contractID = '0x4c11.a949.a311.1404.21dd.4046.23e2.dbf7.f7d0.eb5e.0d38.feb2.1920.a944.268f.dfde'
  return(
    <div
      className="p-4 bg-black"
      style={{
        position:'absolute',
        top: top - 50,
        left: left + 20,
        transform: 'translate(-100%, -100%)'
      }}
    >
      <p className='mb-4'> contractID:
        <a href={`/apps/ziggurat/indexer/address/${contractID}`} target='_blank'>
        {' '}{contractID}
        </a>
      </p>
    <p>create a transaction:</p>
    <p className="">change the media: </p>
      <p className="font-bold ml-2 mb-1">!play https://www.youtube.com/watch?v=3vLHelBuTRM</p>
    <p>send a tip</p>
      <p className="font-bold ml-2 mb-3">!tip 100000</p>

    <p>send a transaction:</p>
    <p>use your Uqbar wallet to sign and approve jukebox transactions</p>

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
