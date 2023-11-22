/**
 * @description Finds all tests that call pressActionKey
 * @kind problem
 * @id javascript/find-all-tests
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is a test.
 */
predicate isTest(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test = it.getArgument(1)
  )
}

predicate callsToPressActionKey(Function test) {
    test.getName() = "pressActionKey"
}

// Query entry point: find tests calling 'pressActionKey' function
from Function test
where isTest(test) and 
    callsToPressActionKey(test)
select test, "Test calling 'pressActionKey' function"