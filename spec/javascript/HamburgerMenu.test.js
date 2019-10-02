import { JSDOM } from 'jsdom';
const dom = new JSDOM('<!DOCTYPE html><html><head></head><body></body></html>');

global.window = dom.window;
global.document = dom.window.document;
let jQuery = require('jquery');
let $ = require('jquery');
global.$ = $
const HamburgerMenu = require("../../app/javascript/components/nav-bar/nav-bar.js");

describe('lol',()=> {
  let Hamburger

  beforeEach(()=>{
    Hamburger = new HamburgerMenu();
  });

  it('should do stuff', ()=>{
    console.log('lol');
  });
});