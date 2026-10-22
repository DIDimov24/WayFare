#include "CppUnitTest.h"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;

int testCalc(int a, int b) {
	return a + b;
}

namespace WayFareTests {
	TEST_CLASS(WayFareTests) {
public:
	TEST_METHOD(TestMethod1) {
		Assert::AreEqual(2, testCalc(1, 2));
	}

	};
}
