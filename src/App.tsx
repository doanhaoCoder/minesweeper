import React, {
    useState, 
} from 'react';
import {
    MineSweeper,
} from './components';

import './App.css';

export default function App(){
    const [
        isShowGame,setIsShowGame,
    ] = useState(false);
    const [
        width,setWidth,
    ] = useState(0);
    const [
        height,setHeight,
    ] = useState(0);
    const [
        mineCount,setMineCount,
    ] = useState(0);

    function selectDifficulty():void{
        setIsShowGame(false);
    }

    return (
        <div className="app">
            <div className={`app-main ${isShowGame?'show-game':''}`}>
                <MineSweeper
                    selectDifficulty={selectDifficulty}
                    play={true}
                    width={8}
                    height={8}
                    mineCount={10}
                />
            </div>
        </div>
    );
}