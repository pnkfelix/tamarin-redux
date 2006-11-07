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
    var SECTION = "15.5.4.4-1";
    var VERSION = "ECMA_1";
    startTest();
    var TITLE   = "String.prototype.charAt";

    writeHeaderToLog( SECTION + " "+ TITLE);

    var TEST_STRING = new String( " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~" );

    var testcases = getTestCases();

    writeLineToLog( "TEST_STRING = new String(\" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~\")" );
    
    test();

function getTestCases() {
    var array = new Array();
    var item = 0;

    for (  i = 0x0020; i < 0x007e; i++, item++) {
        array[item] = new TestCase( SECTION,
                                "TEST_STRING.charAt("+item+")",
                                String.fromCharCode( i ),
                                TEST_STRING.charAt( item ) );
    }
    for ( i = 0x0020; i < 0x007e; i++, item++) {
        array[item] = new TestCase( SECTION,
                                "TEST_STRING.charAt("+item+") == TEST_STRING.substring( "+item +", "+ (item+1) + ")",
                                true,
                                TEST_STRING.charAt( item )  == TEST_STRING.substring( item, item+1 )
                                );
    }
    array[item++] = new TestCase( SECTION,  "String.prototype.charAt.length",       1,  String.prototype.charAt.length );

    return array;
}
