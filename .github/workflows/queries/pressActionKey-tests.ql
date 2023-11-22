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

predicate callsToPressActionKey(FunctionCall call) {
    call.getTarget().getName() = "pressActionKey"
}

// Query entry point: find tests calling 'pressActionKey' function
from Function test, FunctionCall call
where isTest(test) and callsToPressActionKey(call)
select call, "Test calling 'pressActionKey' function"