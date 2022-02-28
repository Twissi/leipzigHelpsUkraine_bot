process.env.NTBA_FIX_319 = 1;
/****************************************************************
 * IMPORTS
 ****************************************************************/

const DOTENV = require('dotenv')
DOTENV.config();
const { OPTIONS } = require.main.require('./setup/config.js');
const { MyApp } = require('./parts/app.js');

/****************************************************************
 * METHODS
 ****************************************************************/

async function main () {
    const app = new MyApp(OPTIONS);
    await app.setup();
}

/****************************************************************
 * EXECUTION
 ****************************************************************/

main();
