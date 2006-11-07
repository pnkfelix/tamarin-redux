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

import StaticPropertyPackage.*;

var SECTION = "Definitions";       // provide a document reference (ie, ECMA section)
var VERSION = "AS3";  // Version of JavaScript or ECMA
var TITLE   = "Access static method of base class";       // Provide ECMA section title or a description
var BUGNUMBER = "";

startTest();                // leave this alone


var obj:AccStatPropViaSubClass = new AccStatPropViaSubClass();

// ********************************************
// Try to access a static property (in a namespace) 
// of the base class via a reference to the subclass 
// ********************************************
var thisError = "no exception thrown";
try{
	var date = obj.ns1::date;
} catch (e1) {
	thisError = e1.toString();
} finally {
	AddTestCase( "access static property in namespace of base class using subclass",
				REFERENCEERROR+1069,
				referenceError( thisError) );
}

// ********************************************
// Try to access a static property of the base 
// class via a reference to the subclass
// ********************************************
thisError = "no exception thrown";
try{
	var str = obj.string;
} catch (e2) {
	thisError = e2.toString();
} finally {
	AddTestCase( "access static property of base class using subclass",
				REFERENCEERROR+1069,
				referenceError( thisError) );
}

// ********************************************
// Try to access the static property of the base 
// class from an instance method in the subclass 
// using "this.foo" 
// ********************************************
var thisError = "no exception thrown";
try{
	var str = obj.getString();
} catch (e3) {
	thisError = e3.toString();
} finally {
	AddTestCase( "access static property of base class in subclass with this.foo",
				REFERENCEERROR+1069,
				referenceError( thisError) );
}

test();       // leave this alone.  this executes the test cases and
              // displays results.
