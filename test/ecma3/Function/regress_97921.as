/* ***** BEGIN LICENSE BLOCK ***** 
 Version: MPL 1.1/GPL 2.0/LGPL 2.1 

The contents of this file are subject to the Mozilla Public License Version 1.1 (the 
"License"); you may not use this file except in compliance with the License. You may obtain 
a copy of the License at http://www.mozilla.org/MPL/ 

Software distributed under the License is distributed on an "AS IS" basis, WITHOUT 
WARRANTY OF ANY KIND, either express or implied. See the License for the specific 
language governing rights and limitations under the License. 

The Original Code is [Open Source Virtual Machine.] 

The Initial Developer of the Original Code is Adobe System Incorporated.  Portions created 
by the Initial Developer are Copyright (C)[ 2005-2006 ] Adobe Systems Incorporated. All Rights 
Reserved. 

Contributor(s): Adobe AS3 Team

Alternatively, the contents of this file may be used under the terms of either the GNU 
General Public License Version 2 or later (the "GPL"), or the GNU Lesser General Public 
License Version 2.1 or later (the "LGPL"), in which case the provisions of the GPL or the 
LGPL are applicable instead of those above. If you wish to allow use of your version of this 
file only under the terms of either the GPL or the LGPL, and not to allow others to use your 
version of this file under the terms of the MPL, indicate your decision by deleting provisions 
above and replace them with the notice and other provisions required by the GPL or the 
LGPL. If you do not delete the provisions above, a recipient may use your version of this file 
under the terms of any one of the MPL, the GPL or the LGPL. 

 ***** END LICENSE BLOCK ***** */
/*
* The contents of this file are subject to the Netscape Public
* License Version 1.1 (the "License"); you may not use this file
* except in compliance with the License. You may obtain a copy of
* the License at http://www.mozilla.org/NPL/
*
* Software distributed under the License is distributed on an "AS
* IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
* implied. See the License for the specific language governing
* rights and limitations under the License.
*
* The Original Code is mozilla.org code.
*
* The Initial Developer of the Original Code is Netscape
* Communications Corporation.  Portions created by Netscape are
* Copyright (C) 1998 Netscape Communications Corporation. All
* Rights Reserved.
*
* Contributor(s): georg@bioshop.de, pschwartau@netscape.com
* Date: 10 September 2001
*
* SUMMARY: Testing with() statement with nested functions
* See http://bugzilla.mozilla.org/show_bug.cgi?id=97921
*
* Brendan: "The bug is peculiar to functions that have formal parameters,
* but that are called with fewer actual arguments than the declared number
* of formal parameters."
*/
//-----------------------------------------------------------------------------
    var SECTION = "";
    var VERSION = "";
    var TITLE = "Testing with() statement with nested functions";

    startTest();

    var bug = 97921;

    writeHeaderToLog( SECTION + " "+ TITLE);

    var testcases = getTestCases();
    test();

function getTestCases() {
    var array = new Array();
    var item = 0;
        
    var UBound = 0;
    var cnYES = 'Inner value === outer value';
    var cnNO = "Inner value !== outer value!";
    var status = '';
    var statusitems = [];
    var actual = '';
    var actualvalues = [];
    var expect= '';
    var expectedvalues = [];
    var outerValue = '';
    var innerValue = '';
    var useWith = '';


    function F(i)
    {
      i = 0;
      if(useWith) with(1){i;}
      i++;
    
      outerValue = i; // capture value of i in outer function
      F1 = function() {innerValue = i;}; // capture value of i in inner function
      
      F1();
    }
    
    status = inSection(1);
    useWith=false;
    F(); // call F without supplying the argument
    actual = innerValue == outerValue;
    expect = true;
    //addThis();
    array[item++] = new TestCase(SECTION, status, expect, actual);
    
    status = inSection(2);
    useWith=true;
    F(); // call F without supplying the argument
    actual = innerValue == outerValue;
    
    expect = true;
    
    //addThis();
    array[item++] = new TestCase(SECTION, status, expect, actual);
    
    
    function G(i)
    {
      i = 0;
      with (new Object()) {i=100};
      i++;
    
      outerValue = i; // capture value of i in outer function
      G1 = function() {innerValue = i;}; // capture value of i in inner function
      G1();
      
    }
    
    
    status = inSection(3);
    G(); // call G without supplying the argument
    actual = innerValue == 101;
    expect = true;
    //addThis();
    array[item++] = new TestCase(SECTION, status, expect, actual);
    
    status = inSection(4);
    G(); // call G without supplying the argument
    actual = innerValue == outerValue;
    expect = true;
    //addThis();
    array[item++] = new TestCase(SECTION, status, expect, actual);
    
    return array;
}

/*
function addThis()
{
  statusitems[UBound] = status;
  actualvalues[UBound] = areTheseEqual(actual);
  
  expectedvalues[UBound] = areTheseEqual(expect);
  UBound++;
}
*/

/*
function test()
{
  enterFunc ('test');
  printBugNumber (bug);
  printStatus (summary);

  for (var i = 0; i < UBound; i++)
  {
   reportCompare(expectedvalues[i], actualvalues[i], statusitems[i]);
    
  }

  exitFunc ('test');
}
*/

function areTheseEqual(yes)
{
  return yes? cnYES : cnNO
}

