/* -*- Mode: C++; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is JavaScript Engine testing utilities.
 *
 * The Initial Developer of the Original Code is
 * Netscape Communications Corp.
 * Portions created by the Initial Developer are Copyright (C) 2002
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *   pschwartau@netscape.com
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** */

startTest();

/*
 *
 * Date:    01 Feb 2002
 * SUMMARY: Testing Error.length
 * See http://bugzilla.mozilla.org/show_bug.cgi?id=123002
 *
 * NOTE: Error.length should equal the length of FormalParameterList of the
 * Error constructor. This is currently 1 in Rhino, 3 in SpiderMonkey.
 *
 * The difference is due to http://bugzilla.mozilla.org/show_bug.cgi?id=50447.
 * As a result of that bug, SpiderMonkey has extended ECMA to allow two new
 * parameters to Error constructors:
 *
 * Rhino:        new Error (message)
 * SpiderMonkey: new Error (message, fileName, lineNumber)
 *
 * NOTE: since we have hard-coded the length expectations, this testcase will
 * have to be changed if the Error FormalParameterList is ever changed again.
 *
 * To do this, just change the two LENGTH constants below -
 */
//-----------------------------------------------------------------------------
var gTestfile = 'regress-123002.js';
var LENGTH_RHINO = 1;
var LENGTH_SPIDERMONKEY = 3;
var UBound = 0;
var BUGNUMBER = 123002;
var summary = 'Testing Error.length';
var QUOTE = '"';
var status = '';
var statusitems = [];
var actual = '';
var actualvalues = [];
var expect= '';
var expectedvalues = [];


function fourArgs(a,b,c,d) {}
AddTestCase('fourArgs length', 4, fourArgs.length);

class MyTestClass {
    public function MyTestClass(a,b,c,d) {}
}

AddTestCase('Class constructor with 4 args - MyTestClass.constructor.length = ', 4, MyTestClass.constructor.length)
/*
 * Are we in Rhino or SpiderMonkey?
 */
var LENGTH_EXPECTED = LENGTH_SPIDERMONKEY;

/*
 * The various NativeError objects; see ECMA-262 Edition 3, Section 15.11.6
 */
var errObjects = [Error, EvalError, RangeError,
		  ReferenceError, SyntaxError, TypeError, URIError];

for (var i in errObjects)
{
  err = errObjects[i];
  status = inSection(quoteThis(err.toString()));
  actual = err.constructor.length;
  expect = LENGTH_EXPECTED;
  addThis();
}



//-----------------------------------------------------------------------------
addtestcases();
//-----------------------------------------------------------------------------



function addThis()
{
  statusitems[UBound] = status;
  actualvalues[UBound] = actual;
  expectedvalues[UBound] = expect;
  UBound++;
}


function addtestcases()
{

  printBugNumber(BUGNUMBER);
  printStatus(summary);

  for (var i=0; i<UBound; i++)
  {
    AddTestCase(statusitems[i], expectedvalues[i], actualvalues[i]);
  }


}


function quoteThis(text)
{
  return QUOTE + text + QUOTE;
}

test();
