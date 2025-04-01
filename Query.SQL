-- Query letra 'A' da questão 1
SELECT 
    s.name AS school_name,
    st.enrolled_at,
    COUNT(st.id) AS student_count,
    SUM(c.price) AS total_revenue
FROM students st
JOIN courses c ON st.course_id = c.id
JOIN schools s ON c.school_id = s.id
WHERE c.name ILIKE 'data%'
GROUP BY s.name, st.enrolled_at
ORDER BY st.enrolled_at DESC;


-- Query letra 'B' da questão 1
WITH daily_enrollments AS (
    SELECT 
        s.name AS school_name,
        st.enrolled_at,
        COUNT(st.id) AS student_count
    FROM students st
    JOIN courses c ON st.course_id = c.id
    JOIN schools s ON c.school_id = s.id
    WHERE c.name ILIKE 'data%'
    GROUP BY s.name, st.enrolled_at
)
SELECT 
    school_name,
    enrolled_at,
    student_count,
    SUM(student_count) OVER (
        PARTITION BY school_name 
        ORDER BY enrolled_at 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_sum,
    AVG(student_count) OVER (
        PARTITION BY school_name 
        ORDER BY enrolled_at 
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS moving_avg_7_days,
    AVG(student_count) OVER (
        PARTITION BY school_name 
        ORDER BY enrolled_at 
        ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
    ) AS moving_avg_30_days
FROM daily_enrollments
ORDER BY school_name, enrolled_at DESC;
