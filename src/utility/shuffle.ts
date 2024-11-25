export function shuffle<T>(mines:Array<T>,start = 1):void {
    for (let i = Math.max(1,start); i < mines.length; i++) {
        const randomIndex = Math.floor(Math.random() * (i + 1));
        const tmp = mines[randomIndex];
        mines[randomIndex] = mines[i];
        mines[i] = tmp;
    }
}