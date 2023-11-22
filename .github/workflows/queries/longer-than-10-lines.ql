/**
 * @description Find functions longer than 10 lines
 * @kind problem
 * @id javascript/longer-than-10-lines
 * @problem.severity recommendation
 */
import javascript

from Function f
where f.getNumLines() > 10
select f, "functions longer than 10 lines"