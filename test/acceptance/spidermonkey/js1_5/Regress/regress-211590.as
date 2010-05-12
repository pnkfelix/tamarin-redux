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
 * Mozilla Foundation.
 * Portions created by the Initial Developer are Copyright (C) 2005
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s): zack-weg@gmx.de
 *                 Bob Clary <bob@bclary.com>
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

var gTestfile = 'regress-211590.js';
//-----------------------------------------------------------------------------
var BUGNUMBER = 211590;
var summary = 'Math.random should be random';
var actual = '';
var expect = 'between 48% and 52%';

printBugNumber(BUGNUMBER);
printStatus (summary);
 
var r = Math.random;
var c = Math.pow( 2, 53 );

var n = 10000;
var odd1 = 0;
var odd2 = 0;

for ( var i = 0; i < n; ++i )
{
  var v= r() * c;
  //print(v, v & 1)
  if ( v & 1 )
    ++odd1;
  if ( v - c + c & 1 )
    ++odd2;
}

odd1 *= 100 / n;
odd2 *= 100 / n;
print(odd1, odd2)

if (odd1 >= 48 && odd1 <= 52)
{
  actual = expect;
}
else
{
  actual = ' is ' + odd1.toFixed(3);
}

AddTestCase(summary, expect, actual);

if (odd2 >= 48 && odd2 <= 52)
{
  actual = expect;
}
else
{
  actual = ' is ' + odd2.toFixed(3);
}

AddTestCase(summary, expect, actual);

test();