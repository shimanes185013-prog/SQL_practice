-- ============================================
-- SQL基本練習：SELECT文の基礎
-- ============================================

-- サンプルテーブル作成
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    grade INT,
    score INT,
    created_at TIMESTAMP
);

-- サンプルデータ挿入
INSERT INTO students VALUES
(1, '太郎', 20, 1, 85, '2026-01-10 09:00:00'),
(2, '花子', 19, 1, 92, '2026-01-10 10:30:00'),
(3, '次郎', 20, 2, 78, '2026-01-10 11:00:00'),
(4, '美咲', 19, 1, 88, '2026-01-10 12:00:00'),
(5, '健太', 21, 3, 95, '2026-01-10 13:00:00'),
(6, '由美', 20, 2, 82, '2026-01-10 14:00:00'),
(7, '誠', 19, 1, 76, '2026-01-10 15:00:00'),
(8, '麻衣', 21, 3, 91, '2026-01-10 16:00:00');

-- ============================================
-- 練習1: 全データを取得
-- ============================================
-- 全カラムを取得
SELECT * FROM students;

-- 特定のカラムのみ取得
SELECT id, name, score FROM students;


-- ============================================
-- 練習2: WHERE句を使った条件絞り込み
-- ============================================
-- スコアが85以上の学生を取得
SELECT * FROM students WHERE score >= 85;

-- 1年生のみを取得
SELECT * FROM students WHERE grade = 1;

-- 名前が「太」を含む学生を取得
SELECT * FROM students WHERE name LIKE '%太%';

-- 年齢が20歳以上の学生を取得
SELECT * FROM students WHERE age >= 20;

-- スコアが80以上かつ学年が1年生
SELECT * FROM students WHERE score >= 80 AND grade = 1;

-- スコアが80未満または学年が3年生
SELECT * FROM students WHERE score < 80 OR grade = 3;

-- 学年が1年生ではない学生（NOT演算子）
SELECT * FROM students WHERE NOT grade = 1;


-- ============================================
-- 練習3: ORDER BY句を使った並べ替え
-- ============================================
-- スコアが高い順に並べる（降順）
SELECT * FROM students ORDER BY score DESC;

-- スコアが低い順に並べる（昇順）
SELECT * FROM students ORDER BY score ASC;

-- 年齢で昇順、同じ年齢の場合はスコアで降順
SELECT * FROM students ORDER BY age ASC, score DESC;

-- 名前のアルファベット順
SELECT * FROM students ORDER BY name ASC;


-- ============================================
-- 練習4: LIMIT句でデータ件数を制限
-- ============================================
-- 最初の3件のみ取得
SELECT * FROM students LIMIT 3;

-- スコアが高い順に上位3人を取得
SELECT * FROM students ORDER BY score DESC LIMIT 3;

-- スコアが高い順に4番目から6番目を取得（オフセット付き）
SELECT * FROM students ORDER BY score DESC LIMIT 3 OFFSET 3;

-- または LIMIT 3, 3 （非標準だが多くのDBで対応）
SELECT * FROM students ORDER BY score DESC LIMIT 3, 3;


-- ============================================
-- 練習5: 複合条件の練習
-- ============================================
-- 学年が1年生で、スコアが80以上の学生を取得し、スコア順にソート
SELECT id, name, grade, score FROM students 
WHERE grade = 1 AND score >= 80 
ORDER BY score DESC;

-- 年齢が19〜20歳の学生を取得し、上位3人を表示
SELECT * FROM students 
WHERE age BETWEEN 19 AND 20 
ORDER BY score DESC 
LIMIT 3;

-- IN演算子を使用：学年が1年生または3年生の学生
SELECT * FROM students 
WHERE grade IN (1, 3) 
ORDER BY grade ASC, score DESC;


-- ============================================
-- 練習6: 別名（AS）を使用
-- ============================================
-- カラムに別名をつける
SELECT 
    id AS student_id,
    name AS student_name,
    score AS test_score
FROM students;

-- テーブルに別名をつける
SELECT s.id, s.name, s.score 
FROM students AS s 
WHERE s.score >= 85;


-- ============================================
-- 練習7: DISTINCT（重複排除）
-- ============================================
-- ユニークな学年を取得
SELECT DISTINCT grade FROM students;

-- ユニークな年齢を取得して昇順にソート
SELECT DISTINCT age FROM students ORDER BY age ASC;


-- ============================================
-- 練習問題（解答付き）
-- ============================================
-- Q1: スコアが90以上の学生の名前とスコアを取得
-- A1:
SELECT name, score FROM students WHERE score >= 90;

-- Q2: 学年が2年生の学生を取得し、スコアが高い順に表示
-- A2:
SELECT * FROM students WHERE grade = 2 ORDER BY score DESC;

-- Q3: 全学生の中でスコアが高い順に上位2人を取得
-- A3:
SELECT * FROM students ORDER BY score DESC LIMIT 2;

-- Q4: 学年が1年生でスコアが80未満の学生を取得
-- A4:
SELECT * FROM students WHERE grade = 1 AND score < 80;

-- Q5: 年齢が20歳以上で学年が2年生または3年生の学生を取得
-- A5:
SELECT * FROM students WHERE age >= 20 AND (grade = 2 OR grade = 3);
