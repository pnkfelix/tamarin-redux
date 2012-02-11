/* -*- c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
/* vi: set ts=4 sw=4 expandtab: (add to ~/.vimrc: set modeline modelines=5) */
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
 * The Original Code is [Open Source Virtual Machine.].
 *
 * The Initial Developer of the Original Code is
 * Adobe System Incorporated.
 * Portions created by the Initial Developer are Copyright (C) 2011
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *   Adobe AS3 Team
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

/*
Returns an implementation-dependent approximation to the result of raising x to the power y.
*/

var SECTION = "4.5.27";
var VERSION = "AS3";
var TITLE   = "public function pow(x:float,y:float):float";

startTest();
writeHeaderToLog( SECTION + " "+ TITLE);

function check(param1:float, param2:float):float { return float.pow(param1, param2); }

AddStrictTestCase("float.pow() returns a float", "float", getQualifiedClassName(float.pow(0,1)));
AddStrictTestCase("float.pow() length is 2", 2, float.pow.length);

// If y is NaN, the result is NaN.
AddStrictTestCase("float.pow(1.0f, float.NaN)", float.NaN, float.pow(1.0f, float.NaN));
AddStrictTestCase("float.pow(1.0f, floatNaN) check()", float.NaN, check(1.0f, float.NaN));

// If y is +0, the result is 1, even if x is NaN.
AddStrictTestCase("float.pow(float.NaN, 0f)", 1f, float.pow(float.NaN, 0f));
AddStrictTestCase("float.pow(1.2f, 0f)", 1f, float.pow(1.2f, 0f));
AddStrictTestCase("float.pow(float.NaN, 0f) check()", 1f, check(float.NaN, 0f));
AddStrictTestCase("float.pow(1.2f, 0f) check()", 1f, check(1.2f, 0f));

// If y is -0, the result is 1, even if x is NaN.
AddStrictTestCase("float.pow(float.NaN, -0f)", 1f, float.pow(NaN, -0f));
AddStrictTestCase("float.pow(1.2f, -0f)", 1f, float.pow(1.2f, -0f));
AddStrictTestCase("float.pow(float.NaN, -0f) check()", 1f, check(float.NaN, -0f));
AddStrictTestCase("float.pow(1.2f, -0f) check()", 1f, check(1.2f, -0f));

// If x is NaN and y is nonzero, the result is NaN.
AddStrictTestCase("float.pow(float.NaN, 1f)", float.NaN, float.pow(float.NaN, 1f));
AddStrictTestCase("float.pow(float.NaN, 1f) check()", float.NaN, check(float.NaN, 1f));

// If abs(x)>1 and y is +Infinity, the result is +Infinity.
AddStrictTestCase("float.pow(1.2f, float.POSITIVE_INFINITY)", float.POSITIVE_INFINITY, float.pow(1.2f, float.POSITIVE_INFINITY));
AddStrictTestCase("float.pow(-1.2f, float.POSITIVE_INFINITY)", float.POSITIVE_INFINITY, float.pow(-1.2f, float.POSITIVE_INFINITY));
AddStrictTestCase("float.pow(1.2f, float.POSITIVE_INFINITY) check()", float.POSITIVE_INFINITY, check(1.2f, float.POSITIVE_INFINITY));
AddStrictTestCase("float.pow(-1.2f, float.POSITIVE_INFINITY) check()", float.POSITIVE_INFINITY, check(-1.2f, float.POSITIVE_INFINITY));

// If abs(x)>1 and y is -Infinity, the result is +0.
AddStrictTestCase("float.pow(1.2f, float.NEGATIVE_INFINITY)", 0f, float.pow(1.2f, float.NEGATIVE_INFINITY));
AddStrictTestCase("float.pow(1.2f, float.NEGATIVE_INFINITY) sign check", float.POSITIVE_INFINITY, float.POSITIVE_INFINITY/float.pow(1.2f, float.NEGATIVE_INFINITY));
AddStrictTestCase("float.pow(-1.2f, float.NEGATIVE_INFINITY)", 0f, float.pow(-1.2f, float.NEGATIVE_INFINITY));
AddStrictTestCase("float.pow(-1.2f, float.NEGATIVE_INFINITY) sign check", float.POSITIVE_INFINITY, float.POSITIVE_INFINITY/float.pow(-1.2f, float.NEGATIVE_INFINITY));
AddStrictTestCase("float.pow(1.2f, float.NEGATIVE_INFINITY) check()", 0f, check(1.2f, float.NEGATIVE_INFINITY));
AddStrictTestCase("float.pow(1.2f, float.NEGATIVE_INFINITY) check() sign check",
                  float.POSITIVE_INFINITY,
                  float.POSITIVE_INFINITY/check(1.2f, float.NEGATIVE_INFINITY));
AddStrictTestCase("float.pow(-1.2f, float.NEGATIVE_INFINITY) check()", 0f, check(-1.2f, float.NEGATIVE_INFINITY));
AddStrictTestCase("float.pow(-1.2f, float.NEGATIVE_INFINITY) check() sign check",
                  float.POSITIVE_INFINITY,
                  float.POSITIVE_INFINITY/check(-1.2f, float.NEGATIVE_INFINITY));


// If abs(x)==1 and y is +Infinity, the result is NaN.
AddStrictTestCase("float.pow(1.0f, float.POSITIVE_INFINITY)", float.NaN, float.pow(1.0f, float.POSITIVE_INFINITY));
AddStrictTestCase("float.pow(-1.0f, float.POSITIVE_INFINITY)", float.NaN, float.pow(-1.0f, float.POSITIVE_INFINITY));
AddStrictTestCase("float.pow(1.0f, float.POSITIVE_INFINITY) check()", float.NaN, check(1.0f, float.POSITIVE_INFINITY));
AddStrictTestCase("float.pow(-1.0f, float.POSITIVE_INFINITY) check()", float.NaN, check(-1.0f, float.POSITIVE_INFINITY));

// If abs(x)==1 and y is -Infinity, the result is NaN.
AddStrictTestCase("float.pow(1.0f, float.NEGATIVE_INFINITY)", float.NaN, float.pow(1.0f, float.POSITIVE_INFINITY));
AddStrictTestCase("float.pow(-1.0f, float.NEGATIVE_INFINITY)", float.NaN, float.pow(-1.0f, float.POSITIVE_INFINITY));
AddStrictTestCase("float.pow(1.0f, float.NEGATIVE_INFINITY) check()", float.NaN, check(1.0f, float.POSITIVE_INFINITY));
AddStrictTestCase("float.pow(-1.0f, float.NEGATIVE_INFINITY) check()", float.NaN, check(-1.0f, float.POSITIVE_INFINITY));

// If abs(x)<1 and y is +Infinity, the result is +0.
AddStrictTestCase("float.pow(0.2f, float.POSITIVE_INFINITY)", 0f, float.pow(0.2f, float.POSITIVE_INFINITY));
AddStrictTestCase("float.pow(0.2f, float.POSITIVE_INFINITY) sign check", float.POSITIVE_INFINITY, float.POSITIVE_INFINITY/float.pow(0.2f, float.POSITIVE_INFINITY));
AddStrictTestCase("float.pow(-0.2f, float.POSITIVE_INFINITY)", 0f, float.pow(-0.2f, float.POSITIVE_INFINITY));
AddStrictTestCase("float.pow(-0.2f, float.POSITIVE_INFINITY) sign check", float.POSITIVE_INFINITY, float.POSITIVE_INFINITY/float.pow(-0.2f, float.POSITIVE_INFINITY));
AddStrictTestCase("float.pow(0.2f, float.POSITIVE_INFINITY) check()", 0f, check(0.2f, float.POSITIVE_INFINITY));
AddStrictTestCase("float.pow(0.2f, float.POSITIVE_INFINITY) check() sign check",
                  float.POSITIVE_INFINITY,
                  float.POSITIVE_INFINITY/check(0.2f, float.POSITIVE_INFINITY));

// If abs(x)<1 and y is -Infinity, the result is +Infinity.
AddStrictTestCase("float.pow(0.2f, float.NEGATIVE_INFINITY)", float.POSITIVE_INFINITY, float.pow(0.2f, float.NEGATIVE_INFINITY));
AddStrictTestCase("float.pow(-0.2f, float.NEGATIVE_INFINITY)", float.POSITIVE_INFINITY, float.pow(-0.2f, float.NEGATIVE_INFINITY));
AddStrictTestCase("float.pow(0.2f, float.NEGATIVE_INFINITY) check()", float.POSITIVE_INFINITY, check(0.2f, float.NEGATIVE_INFINITY));
AddStrictTestCase("float.pow(-0.2f, float.NEGATIVE_INFINITY) check()", float.POSITIVE_INFINITY, check(-0.2f, float.NEGATIVE_INFINITY));

// If x is +Infinity and y>0, the result is +Infinity.
AddStrictTestCase("float.pow(float.POSITIVE_INFINITY, 0.1f)", float.POSITIVE_INFINITY, float.pow(float.POSITIVE_INFINITY, 0.1f));
AddStrictTestCase("float.pow(float.POSITIVE_INFINITY, 0.1f) check()", float.POSITIVE_INFINITY, check(float.POSITIVE_INFINITY, 0.1f));

// If x is +Infinity and y<0, the result is +0.
AddStrictTestCase("float.pow(float.POSITIVE_INFINITY, -0.1f)", 0f, float.pow(float.POSITIVE_INFINITY, -0.1f));
AddStrictTestCase("float.pow(float.POSITIVE_INFINITY, -0.1f) sign check", float.POSITIVE_INFINITY, float.POSITIVE_INFINITY/float.pow(float.POSITIVE_INFINITY, -0.1f));
AddStrictTestCase("float.pow(float.POSITIVE_INFINITY, -0.1) check()", 0f, check(float.POSITIVE_INFINITY, -0.1f));
AddStrictTestCase("float.pow(float.POSITIVE_INFINITY, -0.1) check() sign check",
                  float.POSITIVE_INFINITY,
                  float.POSITIVE_INFINITY/check(float.POSITIVE_INFINITY, -0.1f));

// If x is -Infinity and y>0 and y is an odd integer, the result is -Infinity.
AddStrictTestCase("float.pow(float.NEGATIVE_INFINITY, 1f)", float.NEGATIVE_INFINITY, float.pow(float.NEGATIVE_INFINITY, 1f));
AddStrictTestCase("float.pow(float.NEGATIVE_INFINITY, 1f) check", float.NEGATIVE_INFINITY, check(float.NEGATIVE_INFINITY, 1f));

// If x is -Infinity and y>0 and y is not an odd integer, the result is +Infinity.
AddStrictTestCase("float.pow(float.NEGATIVE_INFINITY, 2f)", float.POSITIVE_INFINITY, float.pow(float.NEGATIVE_INFINITY, 2f));
AddStrictTestCase("float.pow(float.NEGATIVE_INFINITY, 2f) check()", float.POSITIVE_INFINITY, check(float.NEGATIVE_INFINITY, 2f));

// If x is -Infinity and y<0 and y is an odd integer, the result is -0.
AddStrictTestCase("float.pow(float.NEGATIVE_INFINITY, -1f)", -0f, float.pow(float.NEGATIVE_INFINITY, -1f));
AddStrictTestCase("float.pow(float.NEGATIVE_INFINITY, -1f) sign check", float.NEGATIVE_INFINITY, float.POSITIVE_INFINITY/float.pow(float.NEGATIVE_INFINITY, -1f));
AddStrictTestCase("float.pow(float.NEGATIVE_INFINITY, -1f) check()", -0f, check(float.NEGATIVE_INFINITY, -1f));
AddStrictTestCase("float.pow(float.NEGATIVE_INFINITY, -1f) check() sign check",
                  float.NEGATIVE_INFINITY,
                  float.POSITIVE_INFINITY/check(float.NEGATIVE_INFINITY, -1f));

// If x is -Infinity and y<0 and y is not an odd integer, the result is +0.
AddStrictTestCase("float.pow(float.NEGATIVE_INFINITY, -2f)", 0f, float.pow(float.NEGATIVE_INFINITY, -2f));
AddStrictTestCase("float.pow(float.NEGATIVE_INFINITY, -2f) sign check", float.POSITIVE_INFINITY, float.POSITIVE_INFINITY/float.pow(float.NEGATIVE_INFINITY, -2f));
AddStrictTestCase("float.pow(float.NEGATIVE_INFINITY, -2f) check()", 0f, check(float.NEGATIVE_INFINITY, -2f));
AddStrictTestCase("float.pow(float.NEGATIVE_INFINITY, -2f) check() sign check",
                  float.POSITIVE_INFINITY,
                  float.POSITIVE_INFINITY/check(float.NEGATIVE_INFINITY, -2f));

// If x is +0 and y>0, the result is +0.
AddStrictTestCase("float.pow(0f, 2f)", 0f, float.pow(0f, 2f));
AddStrictTestCase("float.pow(0f, 2f) sign check", float.POSITIVE_INFINITY, float.POSITIVE_INFINITY/float.pow(0f, 2f));
AddStrictTestCase("float.pow(0f, 2f) check()", 0f, check(0f, 2f));
AddStrictTestCase("float.pow(0f, 2f) check() sign check", float.POSITIVE_INFINITY, float.POSITIVE_INFINITY/check(0f, 2f));

// If x is +0 and y<0, the result is +Infinity.
AddStrictTestCase("float.pow(0f, -2f)", float.POSITIVE_INFINITY, float.pow(0f, -2f));
AddStrictTestCase("float.pow(0f, -2f) check()", float.POSITIVE_INFINITY, check(0f, -2f));

// If x is -0 and y>0 and y is an odd integer, the result is -0.
AddStrictTestCase("float.pow(-0f, 1f)", -0f, float.pow(-0f, 1f));
AddStrictTestCase("float.pow(-0f, 1f) sign check", float.NEGATIVE_INFINITY, float.POSITIVE_INFINITY/float.pow(-0f, 1f));
AddStrictTestCase("float.pow(-0f, 1f) check()", -0f, check(-0f, 1f));
AddStrictTestCase("float.pow(-0f, 1f) chec() sign check", float.NEGATIVE_INFINITY, float.POSITIVE_INFINITY/check(-0f, 1f));

// If x is -0 and y>0 and y is not an odd integer, the result is +0.
AddStrictTestCase("float.pow(-0f, 2f)", 0f, float.pow(-0f, 2f));
AddStrictTestCase("float.pow(-0f, 2f) sign check", float.POSITIVE_INFINITY, float.POSITIVE_INFINITY/float.pow(-0f, 2f));
AddStrictTestCase("float.pow(-0f, 2f) check()", 0f, check(-0f, 2f));
AddStrictTestCase("float.pow(-0f, 2f) check() sign check", float.POSITIVE_INFINITY, float.POSITIVE_INFINITY/check(-0f, 2f));

// If x is -0 and y<0 and y is an odd integer, the result is -Infinity.
AddStrictTestCase("float.pow(-0f, -1f)", float.NEGATIVE_INFINITY, float.pow(-0f, -1f));
AddStrictTestCase("float.pow(-0f, -1f) check()", float.NEGATIVE_INFINITY, check(-0f, -1f));

// If x is -0 and y<0 and y is not an odd integer, the result is +Infinity.
AddStrictTestCase("float.pow(-0f, -2f)", float.POSITIVE_INFINITY, float.pow(-0f, -2f));
AddStrictTestCase("float.pow(-0f, -2f) check()", float.POSITIVE_INFINITY, check(-0f, -2f));

// If x<0 and x is finite and y is finite and y is not an integer, the result is NaN.
AddStrictTestCase("float.pow(-1.125f, 2.1f)", float.NaN, float.pow(-1.125f, 2.1f));
AddStrictTestCase("float.pow(-1.125f, 2.1f) check()", float.NaN, check(-1.125f, 2.1f));

var param1:float = 3.14159265f;
var param2:float = 0.000001f;
AddStrictTestCase("float.pow(3.14159265f, 0.000001f)", 1.0000011920928955f, float.pow(param1, param2));
AddStrictTestCase("float.pow(3.14159265f, 0.000001f) FloatLiteral", 1.0000011920928955f, float.pow(3.14159265f, 0.000001f));


test();
