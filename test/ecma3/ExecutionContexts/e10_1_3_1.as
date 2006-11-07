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
/* ***** BEGIN LICENSE BLOCK *****
* Version: NPL 1.1/GPL 2.0/LGPL 2.1
*
* The contents of this file are subject to the Netscape Public License
* Version 1.1 (the "License"); you may not use this file except in
* compliance with the License. You may obtain a copy of the License at
* http://www.mozilla.org/NPL/
*
* Software distributed under the License is distributed on an "AS IS" basis,
* WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
* for the specific language governing rights and limitations under the
* License.
*
* The Original Code is JavaScript Engine testing utilities.
*
* The Initial Developer of the Original Code is Netscape Communications Corp.
* Portions created by the Initial Developer are Copyright (C) 2002
* the Initial Developer. All Rights Reserved.
*
* Contributor(s): pschwartau@netscape.com
*
* Alternatively, the contents of this file may be used under the terms of
* either the GNU General Public License Version 2 or later (the "GPL"), or
* the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
* in which case the provisions of the GPL or the LGPL are applicable instead
* of those above. If you wish to allow use of your version of this file only
* under the terms of either the GPL or the LGPL, and not to allow others to
* use your version of this file under the terms of the NPL, indicate your
* decision by deleting the provisions above and replace them with the notice
* and other provisions required by the GPL or the LGPL. If you do not delete
* the provisions above, a recipient may use your version of this file under
* the terms of any one of the NPL, the GPL or the LGPL.
*
* ***** END LICENSE BLOCK *****
*
*
* Date:    11 Feb 2002
* SUMMARY: Testing functions having duplicate formal parameter names
*
* Note: given function f(x,x,x,x) {return x;}; f(1,2,3,4) should return 4.
* See ECMA-262 3rd Edition Final Section 10.1.3: Variable Instantiation
*
* Also see http://bugzilla.mozilla.org/show_bug.cgi?id=124900
*/
//-----------------------------------------------------------------------------
    var SECTION = "e10_1_3_1";
    var VERSION = "";
    var TITLE   = "Testing functions having duplicate formal parameter names";
	var bug     = "124900";

    startTest();
    writeHeaderToLog( SECTION + " "+ TITLE);
    var testcases = getTestCases();
    test();

function getTestCases() {
    var array = new Array();
    var item = 0;

	var status = '';
	var actual = '';
	var expect= '';


	function f1(x,x)
	{
	  return x;
	}
	status = inSection(1);
	actual = f1(1,2);
	expect = 2;
	array[item++] = new TestCase(SECTION, status, expect, actual);


	function f2(x,x,x)
	{
	  return x*x*x;
	}
	status = inSection(2);
	actual = f2(1,2,3);
	expect = 27;
	array[item++] = new TestCase(SECTION, status, expect, actual);


	function f3(x,x,x,x)
	{
	  return 'a' + x + 'b' + x + 'c' + x ;
	}
	status = inSection(3);
	actual = f3(1,2,3,4);
	expect = 'a4b4c4';
	array[item++] = new TestCase(SECTION, status, expect, actual);


	/*
	 * If the value of the last duplicate parameter is not provided by
	 * the function caller, the value of this parameter is undefined
	 */
	function f4(x,a,b,x,z)
	{
	  return x;
	}
	status = inSection(4);
	actual = f4(1,2);
	expect = undefined;
	array[item++] = new TestCase(SECTION, status, expect, actual);


	/*
	 * f.toString() should preserve any duplicate formal parameter names that exist
	 */
	function f5(x,x,x,x)
	{
	}
	status = inSection(5);
	actual = f5.toString();
	expect = 'function Function() {}';
	array[item++] = new TestCase(SECTION, status, expect, actual);


	function f6(x,x,x,x)
	{
	  var ret = [];

	  for (var i=0; i<arguments.length; i++)
	    ret.push(arguments[i]);

	  return ret.toString();
	}
	status = inSection(6);
	actual = f6(1,2,3,4);
	expect = '1,2,3,4';
	array[item++] = new TestCase(SECTION, status, expect, actual);


	/*
	 * This variation (assigning to x inside f) is from nboyd@atg.com
	 * See http://bugzilla.mozilla.org/show_bug.cgi?id=124900
	 */
	function f7(x,x,x,x)
	{
	  x = 999;
	  var ret = [];

	  for (var i=0; i<arguments.length; i++)
	    ret.push(arguments[i]);

	  return ret.toString();
	}
	status = inSection(7);
	actual = f7(1,2,3,4);
	expect = '1,2,3,4';
	array[item++] = new TestCase(SECTION, status, expect, actual);


	/*
	 * Same as above, but with |var| keyword added -
	 */
	function f8(x,x,x,x)
	{
	  var x = 999;
	  var ret = [];

	  for (var i=0; i<arguments.length; i++)
	    ret.push(arguments[i]);

	  return ret.toString();
	}
	status = inSection(8);
	actual = f8(1,2,3,4);
	expect = '1,2,3,4';
	array[item++] = new TestCase(SECTION, status, expect, actual);

    return ( array );
}
