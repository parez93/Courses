/*
###############
file person.js
###############

const person = {
    name:'Fede'
}
export default person


###############
file utility.js
###############
export const clean=() => {...}
export const baseData = 10;


###############
file app.js
###############
import person from './person.js' // --> posso dare il nome che voglio
import prs from './person.js'    // --> posso dare il nome che voglio

import {baseData} from '.utility.js'    // --> il nome deve essere uguale a quello dichiarato
import {clean} from '.utility.js'       // --> il nome deve essere uguale a quello dichiarato
import {baseData as data} from '.utility.js'    // --> baseData è il nome dichiarato, data è il nome custom che poi userò
import * as bundles from '.utility.js'      // --> importo tutto ciò che c'è nel file e mi riferisco ad esso con un alias
*/