package asunit4.framework {
	import asunit.framework.TestCase;
	import asunit4.support.IgnoredMethodTest;

	public class TestIteratorIgnoredMethodTest extends TestCase {
		private var iterator:TestIterator;
		private var ignoredTest:IgnoredMethodTest;

		public function TestIteratorIgnoredMethodTest(testMethod:String = null) {
			super(testMethod);
		}

		protected override function setUp():void {
			ignoredTest = new IgnoredMethodTest();
		}

		protected override function tearDown():void {
			iterator = null;
		}

		public function test_iterator_for_test_with_one_ignored_test_method_hasNext_true():void {
			iterator = new TestIterator(ignoredTest);
			//trace(iterator.next());
			assertTrue(iterator.hasNext());
		}
/*
		public function test_ignored_test_should_yield_no_test_methods():void {
			trace('test_ignored_test_should_yield_no_test_methods()');
			var theTestMethods:Array = TestIterator.getTestMethods(ignoredTest);
			
			assertEquals(0, theTestMethods.length);
		}
*/
		public function test_getTestMethods_should_return_ignored_test():void {
			trace('test_ignored_test_should_yield_no_test_methods()');
			var theTestMethods:Array = TestIterator.getTestMethods(ignoredTest);
			
			assertEquals(1, theTestMethods.length);
			assertEquals('should_be_ignored', Method(theTestMethods[0]).name);
			assertTrue('method.ignore', Method(theTestMethods[0]).ignore);
		}
		
/*
		public function test_get_ignored_methods():void {
			trace('test_get_ignored_methods()');
			var ignoredMethods:Array = TestIterator.getIgnoredMethods(ignoredTest);
			assertEquals(1, testMethods.length);
			assertEquals('should_be_ignored', Method(ignoredMethods[0]).name);
		}
*/
		
	}
}

/*
<factory type="asunit4.support::IgnoredMethodTest">
  <extendsClass type="Object"/>
  <method name="runAfter" declaredBy="asunit4.support::IgnoredMethodTest" returnType="void">
    <metadata name="After"/>
  </method>
  <method name="should_be_ignored" declaredBy="asunit4.support::IgnoredMethodTest" returnType="void">
    <metadata name="Test"/>
    <metadata name="Ignore"/>
  </method>
  <method name="runBefore" declaredBy="asunit4.support::IgnoredMethodTest" returnType="void">
    <metadata name="Before"/>
  </method>
</factory>
*/
