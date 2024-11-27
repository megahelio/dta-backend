-- --------------------------------------------------------
-- Host:                    isbalancedatc     127.0.0.1
-- Versión del servidor:         11.4.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para isbalanced
CREATE DATABASE IF NOT EXISTS `isbalanced` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'isbalanced' @'localhost' IDENTIFIED BY 'isbalanced';
GRANT ALL PRIVILEGES ON isbalanced.* TO 'isbalanced' @'localhost';
FLUSH PRIVILEGES;

USE `isbalanced`;

-- Volcando estructura para tabla isbalanced.atc
CREATE TABLE IF NOT EXISTS `atc` (
  `atcCode` varchar(255) NOT NULL,
  `atcDescription` varchar(255) DEFAULT NULL,
  `locale` varchar(255) NOT NULL,
  PRIMARY KEY (`atcCode`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla isbalanced.atc: ~44 rows (aproximadamente)
DELETE FROM `atc`;
INSERT INTO `atc` (`atcCode`, `atcDescription`, `locale`) VALUES
	('A03F', 'Propulsive', 'en_US'),
	('A03F', 'Propulsivos', 'es_ES'),
	('A10B', 'Hypoglycemic agents excluding insulins', 'en_US'),
	('A10B', 'Hipoglucemiantes excluyendo insulinas', 'es_ES'),
	('C01B', 'Class I and III antiarrhythmics', 'en_US'),
	('C01B', 'Antiarrítmicos de la clase I y III', 'es_ES'),
	('C01E', 'Other heart preparations', 'en_US'),
	('C01E', 'Otros preparados para el corazón', 'es_ES'),
	('C05A', 'Topical agents for the treatment of hemorrhoids and anal fissures ', 'en_US'),
	('C05A', 'Agentes de uso tópico para el tratamiento de hemoroides y fisuras anales', 'es_ES'),
	('C09C', 'Angiotensin 2 receptor blockers', 'en_US'),
	('C09C', 'Bloqueantes del receptor de angiotensina 2', 'es_ES'),
	('C09X', 'Other agents that act on the RAAS', 'en_US'),
	('C09X', 'Otros agentes que actuan sobre el SRAA', 'es_ES'),
	('C10A', 'Lipid-modifying agents, monodrug', 'en_US'),
	('C10A', 'Agentes modificadores de lípidos, monofármacos', 'es_ES'),
	('D11A', 'Other dermatological preparations', 'en_US'),
	('D11A', 'Otros preparados dermatológicos', 'es_ES'),
	('G03C', 'Estrogens', 'en_US'),
	('G03C', 'Estrógenos', 'es_ES'),
	('G03X', 'Other sex hormones and genital system modulators', 'en_US'),
	('G03X', 'Otras hormonas sexuales y moduladores del sistema genital', 'es_ES'),
	('J01M', 'Antibacterial quinolones', 'en_US'),
	('J01M', 'Quinolonas antibacterianas', 'es_ES'),
	('M01A', 'Non-steroidal anti-inflammatory and antirheumatic products', 'en_US'),
	('M01A', 'Productos antiinflamatorios y antireumáticos no esteroideos', 'es_ES'),
	('M03B', 'Other centrally acting relaxing agents', 'en_US'),
	('M03B', 'Otros agentes relajantes de acción central', 'es_ES'),
	('M05B', 'Other agents that affect bone structure and mineralization', 'en_US'),
	('M05B', 'Otros agentes que afectan la estructura ósea y la mineralización', 'es_ES'),
	('N01B', 'Local anesthetics', 'en_US'),
	('N01B', 'Anestésicos locales', 'es_ES'),
	('N04B', 'Dopaminergic agents', 'en_US'),
	('N04B', 'Agentes dopaminérgicos', 'es_ES'),
	('N06A', 'Antidepressants', 'en_US'),
	('N06A', 'Antidepresivos', 'es_ES'),
	('N06D', 'Anti-dementia drugs', 'en_US'),
	('N06D', 'Fármacos antidemencia', 'es_ES'),
	('N07C', 'Drugs against vertigo', 'en_US'),
	('N07C', 'Fármacos contra el vértigo', 'es_ES'),
	('R03D', 'Other agents against bstructive respiratory tract conditions', 'en_US'),
	('R03D', 'Otros agentes contra padecimientos bstructivos de las vías respiratorias', 'es_ES'),
	('R06A', 'Antihistamines for systemic use', 'en_US'),
	('R06A', 'Antihistamínicos para uso sistémico', 'es_ES');

-- Volcando estructura para tabla isbalanced.drug
CREATE TABLE IF NOT EXISTS `drug` (
  `drugId` bigint(20) NOT NULL AUTO_INCREMENT,
  `atcCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`drugId`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla isbalanced.drug: ~45 rows (aproximadamente)
DELETE FROM `drug`;
INSERT INTO `drug` (`drugId`, `atcCode`) VALUES
	(1, 'C09X'),
	(2, 'C10A'),
	(3, 'C10A'),
	(4, 'C01B'),
	(5, 'C01E'),
	(6, 'C09C'),
	(7, 'C01E'),
	(8, 'C01E'),
	(9, 'R06A'),
	(10, 'D11A'),
	(11, 'A10B'),
	(12, 'A10B'),
	(13, 'A10B'),
	(14, 'A10B'),
	(15, 'A10B'),
	(16, 'A10B'),
	(17, 'A03F'),
	(18, 'G03C'),
	(19, 'J01M'),
	(20, 'N06D'),
	(21, 'N06D'),
	(22, 'N06D'),
	(23, 'N06D'),
	(24, 'N07C'),
	(25, 'N04B'),
	(26, 'N06A'),
	(27, 'N06A'),
	(28, 'N06A'),
	(29, 'N06A'),
	(30, 'N06A'),
	(31, 'N06A'),
	(32, 'M01A'),
	(33, 'M01A'),
	(34, 'M01A'),
	(35, 'M01A'),
	(36, 'M01A'),
	(37, 'M05B'),
	(38, 'M01A'),
	(39, 'M01A'),
	(40, 'N01B'),
	(41, 'M03B'),
	(42, 'G03C'),
	(43, 'R03D'),
	(44, 'G03X'),
	(45, 'C05A');

-- Volcando estructura para tabla isbalanced.druglanguage
CREATE TABLE IF NOT EXISTS `druglanguage` (
  `drugId` bigint(20) NOT NULL,
  `alternativeProposalPrescribe` text DEFAULT NULL,
  `benefitsAvoid` text DEFAULT NULL,
  `indication` varchar(255) DEFAULT NULL,
  `locale` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `reasonWhyToAvoid` text DEFAULT NULL,
  PRIMARY KEY (`drugId`,`locale`),
  CONSTRAINT `FKfv3x1w013xtsro08j146yr10m` FOREIGN KEY (`drugId`) REFERENCES `drug` (`drugId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla isbalanced.druglanguage: ~90 rows (aproximadamente)
DELETE FROM `druglanguage`;
INSERT INTO `druglanguage` (`drugId`, `alternativeProposalPrescribe`, `benefitsAvoid`, `indication`, `locale`, `name`, `reasonWhyToAvoid`) VALUES
	(1, 'Thiazidic diuretics or ACEIs', 'Not proven to prevent CARDIOVASCULAR EVENTS', 'Antihypertensive', 'en_US', 'Aliskiren', 'Adverse cardiovascular effects (including MI and HF) and cardiovascular death'),
	(1, 'Diuréticos tiazídicos o IECA', 'No ha demostrado prevenir EVENTOS CARDIOVASCULARES', 'Antihipertensivo', 'es_ES', 'Aliskireno', 'Efectos adversos cardiovasculares (incluído IM y IC) y muerte cardiovascular'),
	(2, 'Gemfibrozil is the only one that has been shown to prevent cardiovascular events (when a fibrate is justified)', 'Not shown to prevent cardiovascular events', 'Lipid-lowering agent', 'en_US', 'Bezafibrate', 'Adverse skin, hematological and renal effects'),
	(2, 'Gemfibrozilo es el único que ha demostrado prevenir eventos cardiovaculares (cuando un fibrato está justificado)', 'No ha demostrado prevenir eventos cardiovasculares', 'Hipolipemiante', 'es_ES', 'Bezafibrato', 'Efectos adversos cutáneos , hematológicos y renales'),
	(3, 'Gemfibrozil is the only one that has been shown to prevent cardiovascular events (when a fibrate is justified)', 'Not shown to prevent cardiovascular events', 'Lipid-lowering agent', 'en_US', 'Fenofibrate', 'Adverse skin, hematological and renal effects'),
	(3, 'Gemfibrozilo es el único que ha demostrado prevenir eventos cardiovaculares (cuando un fibrato está justificado) ', 'No ha demostrado prevenir eventos cardiovasculares', 'Hipolipemiante', 'es_ES', 'Fenofibrato', 'Efectos adversos cutáneos , hematológicos y renales'),
	(4, 'Amidarone is a better option', 'Less effective than amiodarone in preventing recurrent AF', 'Antiarrhythmic', 'en_US', 'Droneradone', 'Adverse hepatic, pulmonary and cardiac effects'),
	(4, 'Amidarona es mejor opción', 'Menos efectivo que la amiodarona en prevención de la FA recurrente', 'Antiarrítmico', 'es_ES', 'Droneradona', 'Efectos advesos hepáticos, pulmonares y cardíacos'),
	(5, 'In angina: beta-blockers and CAA type amlodipine and verapamil. In HF: refrain from adding medications to already stabilized treatment, another option is to use beta blockers with proven efficacy in mortality', 'It has no advantages in either angina or heart failure', 'Antianginous', 'en_US', 'Ivabradine', 'Adverse visual and cardiovascular effects (including MI), potentially severe bradycardia and other arrhythmias'),
	(5, 'En angina: betabloqueantes y CAA tipo amlodipino y verapamilo. En IC: abstenerse de añadir medicamentos al tratamiento ya estabilizado otra opción es usar betabloqueante con eficacia provada en mortalidad', 'No tiene ventajas ni en angina ni insuficiencia cardíaca', 'Antianginoso', 'es_ES', 'Ivabradina', 'Efectos adversos visuales, cardiovasculares (incluído IM), bradicardia potencialmente severa y otras arritmias'),
	(6, '', 'Not more effective than other ARBs against the complications of HTN', 'Antihypertensive', 'en_US', 'Olmesartan', 'Srue-like enteropathy with diarrhea (potentially severe) and weight loss, and possibly increased risk of cardiovascular mortality'),
	(6, '', 'No es más efectivo que otros ARA2 frente a las complicaciones de la HTA', 'Antihipertensivo', 'es_ES', 'Olmesartan', 'Enteropatía tipo srúe-like con diarrea (potencialmente severa) y pérdida de peso, y posiblemente, incremento de riesgo de mortalidad cardiovascular'),
	(7, '', 'Antiaginous with little known mechanism, causes disproportionate adverse effects compared to its minimal effectiveness in reducing the frequency of attacks', 'Antianginous', 'en_US', 'Ranolazine', 'Gastrointestinal adverse effects and neuropsychiatric disorders, palpitations, bradycardia, hypotension, QT prolongation and peripheral edema'),
	(7, '', 'Antiaginoso con mecanismo poco conocido, provoca efectos adversos desproporcionados frente a su mínima eficacia en reducir la frecuencia de los ataques', 'Antianginoso', 'es_ES', 'Ranolazina', 'Efectos adversos gastrointestinales y trastornos neuropsiquiátricos, palpitaciones, bradicardia, hipotensión, prolongación del QT y edema periférico'),
	(8, 'Beta blockers and CAA (amlodipine and verapamil)', 'Uncertain properties, used in angina despite its modest symptomatic effect (mainly demonstrated in stress tests)', 'Antianginous', 'en_US', 'Trimetazidine', 'Parkinsonism, hallucinations and thrombocytopenia'),
	(8, 'Betabloqueantes y CAA (amlodipino y verapamilo)', 'Propiedades inciertas, se usa en angina a pesar de su modesto efecto sintomático (demostrado principalmente en pruebas de esfuerzo)', 'Antianginoso', 'es_ES', 'Trimetazidina', 'Parkinsonismo, alucinaciones y trombocitopenia'),
	(9, 'Non-sedating antihistamines without anticholinergic activity such as cetirizine or loratadine', 'Modest efficacy', 'Antihistamine', 'en_US', 'Mequitazine', 'Prolongs QT interval'),
	(9, 'Antihistamínicos no sedantes sin actividad anticolinérgica como cetirizina o loratadina ', 'Eficacia modesta', 'Antihistamínico', 'es_ES', 'Mequitazine', 'Prolonga el intervalo QT'),
	(10, 'Topical corticosteroids to treat flares is a better option', 'Efficacy hardly differs from topical corticosteroids', 'Immunosuppressant', 'en_US', 'Tacrolimus (topical)', 'Skin cancer and lymphoma'),
	(10, 'Corticosteroides tópicos para tratar los brotes es una mejor opción', 'Eficacia apenas difiere de los corticosteroides tópicos', 'Inmunosupresor', 'es_ES', 'Tacrolimus (tópico)', 'Cáncer de piel y linfoma'),
	(11, 'Metformin, or sulfonylureas (glibenclamide) or insulin are more reasonable options', 'Has not demonstrated efficacy in diabetes complications (cardiovascular, kidney failure, neurological disorders, etc.)', 'Antidiabetic', 'en_US', 'Alogliptin', 'Severe S. Stevens-Johnson type hypersensitivity reactions, infections (urinary tract, upper respiratory tract), pancreatitis , bullous pemphigus and intestinal obstruction.'),
	(11, 'Metformina, o sulfonilureas (glibenclamida) o insulina son opciones más razonables ', 'No ha demostrado eficacia en las complicaciones de la diabetes (cardiovasculares, fallo renal, trastornos neurológicos etc…)', 'Antidiabético', 'es_ES', 'Alogliptina', 'Reacciones de hipersensibilidad graves tipo S. Stevens-Johnson, infecciones (tracto urinario, tracto respiratorio superior), pancreatitis, pénfigo bulloso y obstrucción intestinal.'),
	(12, 'Metformin, or sulfonylureas (glibenclamide) or insulin are more reasonable options', 'It has not demonstrated efficacy in the complications of diabetes (cardiovascular, kidney failure, neurological disorders, etc.)', 'Antidiabetic', 'en_US', 'Linagliptin', 'Severe S. Stevens-Johnson type hypersensitivity reactions, infections (urinary tract, upper respiratory tract), pancreatitis , bullous pemphigus and intestinal obstruction.'),
	(12, 'Metformina, o sulfonilureas (glibenclamida) o insulina son opciones más razonables ', 'No ha demostrado eficacia en las complicaciones de la diabetes (cardiovasculares, fallo renal, trastornos neurológicos etc…)', 'Antidiabético', 'es_ES', 'Linagliptina', 'Reacciones de hipersensibilidad graves tipo S. Stevens-Johnson, infecciones (tracto urinario, tracto respiratorio superior), pancreatitis, pénfigo bulloso y obstrucción intestinal.'),
	(13, 'Metformin, or sulfonylureas (glibenclamide) or insulin are more reasonable options', 'It has not demonstrated efficacy in the complications of diabetes (cardiovascular, kidney failure, neurological disorders, etc.)', 'Antidiabetic', 'en_US', 'Saxagliptin', 'Severe S. Stevens-Johnson type hypersensitivity reactions, infections (urinary tract, upper respiratory tract), pancreatitis , bullous pemphigus and intestinal obstruction.'),
	(13, 'Metformina, o sulfonilureas (glibenclamida) o insulina son opciones más razonables ', 'No ha demostrado eficacia en las complicaciones de la diabetes (cardiovasculares, fallo renal, trastornos neurológicos etc…)', 'Antidiabético', 'es_ES', 'Saxagliptina', 'Reacciones de hipersensibilidad graves tipo S. Stevens-Johnson, infecciones (tracto urinario, tracto respiratorio superior), pancreatitis, pénfigo bulloso y obstrucción intestinal.'),
	(14, 'Metformin, or sulfonylureas (glibenclamide) or insulin are more reasonable options', 'Has not demonstrated efficacy in the complications of diabetes (cardiovascular, kidney failure, neurological disorders, etc.)', 'Antidiabetic', 'en_US', 'Sitagliptin', 'Severe S. Stevens-Johnson type hypersensitivity reactions, infections (urinary tract, upper respiratory tract), pancreatitis , bullous pemphigus and intestinal obstruction.'),
	(14, 'Metformina, o sulfonilureas (glibenclamida) o insulina son opciones más razonables ', 'No ha demostrado eficacia en las complicaciones de la diabetes (cardiovasculares, fallo renal, trastornos neurológicos etc…)', 'Antidiabético', 'es_ES', 'Sitagliptina', 'Reacciones de hipersensibilidad graves tipo S. Stevens-Johnson, infecciones (tracto urinario, tracto respiratorio superior), pancreatitis, pénfigo bulloso y obstrucción intestinal.'),
	(15, ' Metformin, or sulfonylureas (glibenclamide) or insulin are more reasonable options', 'Has not demonstrated efficacy in diabetes complications (cardiovascular, renal failure, neurological disorders etc…)', 'Antidiabetic', 'en_US', 'Vidagliptin', ' Severe S. Stevens-Johnson type hypersensitivity reactions, infections (urinary tract, upper respiratory tract), pancreatitis, bullous pemphigus and intestinal obstruction.'),
	(15, 'Metformina, o sulfonilureas (glibenclamida) o insulina son opciones más razonables ', 'No ha demostrado eficacia en las complicaciones de la diabetes (cardiovasculares, fallo renal, trastornos neurológicos etc…)', 'Antidiabético', 'es_ES', 'Vidagliptina', 'Reacciones de hipersensibilidad graves tipo S. Stevens-Johnson, infecciones (tracto urinario, tracto respiratorio superior), pancreatitis, pénfigo bulloso y obstrucción intestinal.'),
	(16, 'Metformin, or sulfonylureas (glibenclamide) or insulin are more reasonable options', 'It has not demonstrated efficacy in the complications of diabetes (cardiovascular, kidney failure, neurological disorders, etc.)', 'Antidiabetic', 'en_US', 'Pioglitazone', ''),
	(16, 'Metformina, o sulfonilureas (glibenclamida) o insulina son opciones más razonables ', 'No ha demostrado eficacia en las complicaciones de la diabetes (cardiovasculares, fallo renal, trastornos neurológicos etc…)', 'Antidiabético', 'es_ES', 'Pioglitazona', ''),
	(17, 'Antacids and omeprazole, best option in gastroesophageal reflux. If an antiemetic neuroleptic is justified, metoclopramide is better', 'Weak efficacy against nausea and vomiting and gastroesophageal reflux Nausea, vomiting', 'Nausea, vomiting', 'en_US', 'Domperidone', 'Ventricular arrhythmias and sudden death'),
	(17, 'Antiácidos y omeprazol mejor opción en reflujo gastroesofágico. Si está justificado un neuroléptico antiemético,es mejor metoclopramida ', 'Eficacia débil frente nauseas y vómitos y reflujo Nauseas, vomitos gastroesofágico', 'Nauseas, vómitos', 'es_ES', 'Domperidona', 'Arrítmias ventriculares y muerte súbita'),
	(18, 'Combination estrogen/progestogen used at the lowest dose for the shortest possible time', 'Synthetic steroid hormone used in hormone replacement therapy', 'Hormone therapy', 'en_US', 'Tibolone', 'Cardiovascular disorders, breast cancer and ovarian cancer'),
	(18, 'Combinación estrógeno/progestágeno usado a la menor dosis el menor tiempo posible ', 'Hormona esteroide sintética utilizada en terapia hormonal sustititiva', 'Terapia hormonal', 'es_ES', 'Tibolona', 'Trastornos cardiovasculares, cáncer de mama y cáncer de ovario'),
	(19, 'Ciprofloxacin or ofloxacin are a better optionJO1M', 'It is not more effective than other fluoroquinolones', 'Antibiotic', 'en_US', 'Moxifloxacin', 'Toxic epidermal necrolysis, fluminant hepatitis and has been related to an increase in cardiac disorders'),
	(19, 'Ciprofloxacino o ofloxacino son mejor opciónJO1M', 'No es más efectivo que otras fluoroquinolonas', 'Antibiótico', 'es_ES', 'Moxifloxacino', 'Necrolisis epidérmica tóxica, hepatitis fluminante y se ha relacionado con incremento de trastornos cardíacos'),
	(20, 'It is better to reorganize the patient\'s daily life, keep him active, provide support to caregivers and family members', 'Minimal and transient effectiveness', 'Alzheimer\'s', 'en_US', 'Donepezil', 'Cardiovascular, neuropsychiatric, cardiac disorders and conduction disorders'),
	(20, 'Es mejor reorganizar la vida diaria del paciente, mantenerlo activo, proporcionar apoyo a cuidadres y familiares', 'Eficacia mínima y transitoria', 'Alzheimer', 'es_ES', 'Donepezilo', 'Trastornos cardiovasculares, neuropsiquiátricos, cardíacos y trastornos en la conducción'),
	(21, 'It is better to reorganize the patient\'s daily life, keep him active, provide support to caregivers and family members', 'Minimal and transient effectiveness', 'Alzheimer\'s', 'en_US', 'Galantamine', 'Cardiovascular, neuropsychiatric, cardiac disorders and conduction disorders'),
	(21, 'Es mejor reorganizar la vida diaria del paciente, mantenerlo activo, proporcionar apoyo a cuidadres y familiares', 'Eficacia mínima y transitoria', 'Alzheimer', 'es_ES', 'Galantamina', 'Trastornos cardiovasculares, neuropsiquiátricos, cardíacos y trastornos en la conducción'),
	(22, 'It is better to reorganize the patient\'s daily life, keep him active, provide support to caregivers and family members', 'Minimal and transient effectiveness', 'Alzheimer\'s', 'en_US', 'Rivastigmine', 'Cardiovascular, neuropsychiatric, cardiac disorders and conduction disorders'),
	(22, 'Es mejor reorganizar la vida diaria del paciente, mantenerlo activo, proporcionar apoyo a cuidadres y familiares', 'Eficacia mínima y transitoria', 'Alzheimer', 'es_ES', 'Rivastigmina', 'Trastornos cardiovasculares, neuropsiquiátricos, cardíacos y trastornos en la conducción'),
	(23, 'It is better to reorganize the patient\'s daily life, keep him active, provide support to caregivers and family', 'Minimal and transient effectiveness', 'Alzheimer\'s', 'en_US', 'Memantine', 'Neuropsychiatric disorders (hallucinations, confusion, vertigo and headache) as well as seizures and heart failure'),
	(23, 'Es mejor reorganizar la vida diaria del paciente, mantenerlo activo, proporcionar apoyo a cuidadres y familiares', 'Eficacia mínima y transitoria', 'Alzheimer', 'es_ES', 'Memantina', 'Trastornos neuropsiquiátricos (alucinaciones, confusión, vértigo y dolor de cabeza) así como convulsiones e insuficiencia cardíaca'),
	(24, 'Propranolol', 'At most modest efficacy (prevents an attack every two months)', 'Migraine', 'en_US', 'Flunarizine', 'Extrapyramidal, cardiac and weight gain disorders'),
	(24, 'Propranolol', 'Como mucho eficacia modesta (previene un ataque cada dos meses)', 'Migraña', 'es_ES', 'Flunarizina', 'Trastornos extrapiramidales, cardíacos y ganacia de peso'),
	(25, 'Entacapone is the best option when other treatments have been tried', '', 'Parkinson\'s', 'en_US', 'Tolcapone', 'Life-threatening liver damage'),
	(25, 'Entacapone es la mejor opción cuando otros tratamiento han sido probados', '', 'Parkinson', 'es_ES', 'Tolcapona', 'Daño hepático potencialmente mortal'),
	(26, 'Choose an antidepressant from those with the most experience with an adverse effect profile sufficiently documented', 'Has not demonstrated efficacy beyond placebo', 'Antidepressant', 'en_US', 'Agomelatine', 'Hepatitis and pancreatitis, suicide and aggression, as well as serious skin disorders including Stevens-Johnson Syndrome'),
	(26, 'Elegir un antidepresivo de los de mayor experiencia con un perfil de efectos adversos suficientemente documentado', 'No ha demostrado eficacia más allá de placebo', 'Antidepresivo', 'es_ES', 'Agomelatina', 'Hepatitis y pancreatitis, suicidio y agresión, así como trastornos de piel graves incluyendo Síndrome de Stevens-Johnson'),
	(27, 'Choose an antidepressant from those of greater experience with a sufficiently documented profile of adverse effects', 'Does not offer greater efficacy compared to other antidepressants', 'Antidepressant', 'en_US', 'Duloxetine', 'Cardiac disorders (hypertension, tachycardia, arrhythmias, etc.), hepatitis and severe skin hypersensitivity reactions type S. Stevens-Johnson'),
	(27, 'Elegir un antidepresivo de los de mayor experiencia con un perfil de efectos adversos suficientemente documentado', 'No ofrece mayor eficacia comparado con otros antidepresivos', 'Antidepresivo', 'es_ES', 'Duloxetina', 'Trastornos cardíacos (hipertensión, taquicardia, arrítmias, etc..), hepatitis y reacciones de hipersensibilidad cutánea graves tipo S. Stevens-Johnson'),
	(28, 'Choose an antidepressant from those with the most experience with a sufficiently documented profile of adverse effects', 'Does not offer greater efficacy compared to other antidepressants', 'Antidepressant', 'en_US', 'Citalopram', 'Prolongation of the QT interval and torsades de pointes and worse outcome in case of overdose'),
	(28, 'Elegir un antidepresivo de los de mayor experiencia con un perfil de efectos adversos suficientemente documentado', 'No ofrece mayor eficacia comparado con otros antidepresivos', 'Antidepresivo', 'es_ES', 'Citalopram', 'Prolongación del intervalo QT y torsades de pointes y peor resultado en caso de sobredosis'),
	(29, 'Choose an antidepressant from those with the most experience with a sufficiently documented profile of adverse effects', 'Does not offer greater efficacy compared to other antidepressants', 'Antidepressant', 'en_US', 'Escitalopram', 'Prolongation of the QT interval and torsades de pointes and worse outcome in case of overdose'),
	(29, 'Elegir un antidepresivo de los de mayor experiencia con un perfil de efectos adversos suficientemente documentado', 'No ofrece mayor eficacia comparado con otros antidepresivos', 'Antidepresivo', 'es_ES', 'Escitalopram', 'Prolongación del intervalo QT y torsades de pointes y peor resultado en caso de sobredosis'),
	(30, 'Choose an antidepressant from those with the most experience with an effect profile Sufficiently documented adverse events', 'Does not offer greater efficacy compared to other antidepressants', 'Antidepressant', 'en_US', 'Venlafaxine', 'Cardiac disorders (hypertension, tachycardia, arrhythmias, QT prolongation, etc.) and high risk of cardiac arrest'),
	(30, 'Elegir un antidepresivo de los de mayor experiencia con un perfil de efectos adversos suficientemente documentado', 'No ofrece mayor eficacia comparado con otros antidepresivos', 'Antidepresivo', 'es_ES', 'Venlafaxina', 'Trastornos cardíacos (hipertensión, taquicardia, arrítmias,prolongación QT etc..) y alto riesgo de parada cardíaca'),
	(31, 'Choose a well-established antidepressant with a sufficiently documented adverse effect profile', 'Efficacy has not been demonstrated', 'Antidepressant', 'en_US', 'Tianeptine', 'Hepatitis, life-threatening skin reactions (including bullous dermatitis) and addiction'),
	(31, 'Elegir un antidepresivo de los de mayor experiencia con un perfil de efectos adversos suficientemente documentado', 'No ha demostrado eficacia', 'Antidepresivo', 'es_ES', 'Tianeptina', 'Hepatitis, reacciones de piel potencialmente mortales (incluido dermatitis bullosa) y adicción'),
	(32, ' When paracetamol is inadequate, ibuprofen or naproxen are the lower risk options', 'Other NSAIDs have equal efficacy and lower risk', 'Pain, inflammation ', 'en_US', 'Celecoxib', ' Excess cardiovascular events (including MI and thrombosis) and skin reactions'),
	(32, 'Cuando paracetamol resulte inadecuado, ibuprofeno o naproxeno son las opciones de menor riesgo', 'Otros Aines tienen igual eficacia y menor riesgo', 'Dolor, inflamación ', 'es_ES', 'Celecoxib', 'Exceso de eventos cardiovasculares (incluido IM y trombosis) y reacciones de piel'),
	(33, 'When paracetamol is inappropriate, ibuprofen or naproxen are the lower risk options', 'Other NSAIDs have equal efficacy and lower risk', 'Pain, inflammation', 'en_US', 'Etoricoxib', 'Excess cardiovascular events (including MI and thrombosis) and skin reactions'),
	(33, 'Cuando paracetamol resulte inadecuado, ibuprofeno o naproxeno son las opciones de menor riesgo', 'Otros Aines tienen igual eficacia y menor riesgo', 'Dolor, inflamación ', 'es_ES', 'Etoricoxib', 'Exceso de eventos cardiovasculares (incluido IM y trombosis) y reacciones de piel'),
	(34, 'When paracetamol is inappropriate, ibuprofen or naproxen are the lower risk options', 'Other NSAIDs have equal efficacy and lower risk', 'Pain, inflammation', 'en_US', 'Aceclofenac', 'Adverse cardiovascular effects (including MI and HF) and cardiovascular deaths'),
	(34, 'Cuando paracetamol resulte inadecuado, ibuprofeno o naproxeno son las opciones de menor riesgo', 'Otros Aines tienen igual eficacia y menor riesgo', 'Dolor, inflamación ', 'es_ES', 'Aceclofenaco', 'Efectos adversos cardiovasculares (incluído IM y IC) y muertes cardiovasculares'),
	(35, 'When paracetamol is inappropriate, ibuprofen or naproxen are the lower risk options', 'Other NSAIDs have equal efficacy and lower risk', 'Pain, inflammation', 'en_US', 'Diclofenac', 'Adverse cardiovascular effects (including MI and HF) and cardiovascular deaths'),
	(35, 'Cuando paracetamol resulte inadecuado, ibuprofeno o naproxeno son las opciones de menor riesgo', 'Otros Aines tienen igual eficacia y menor riesgo', 'Dolor, inflamación ', 'es_ES', 'Diclofenaco', 'Efectos adversos cardiovasculares (incluído IM y IC) y muertes cardiovasculares'),
	(36, 'When paracetamol is inappropriate, ibuprofen or naproxen are the lowest risk options', 'Other NSAIDs have equal efficacy and lower risk', 'Pain, inflammation', 'en_US', 'Piroxicam (systemic)', 'Increased risk of gastrointestinal and skin disorders (including toxic epidermal necrolysis)'),
	(36, 'Cuando paracetamol resulte inadecuado, ibuprofeno o naproxeno son las opciones de menor riesgo', 'Otros Aines tienen igual eficacia y menor riesgo', 'Dolor, inflamación ', 'es_ES', 'Piroxicam  (sistémico)', 'Incremento del riesgo gastrointestinal y trastornos cutáneos (incluido necrolisis epidérmica tóxica)'),
	(37, 'There is no satisfactory treatment for osteoporosis', 'Modest effective in preventing osteoporotic fractures and not effective in bone loss in prostate cancer', 'Osteoporosis', 'en_US', 'Denosumab 60 mg', 'Back pain, musculoskeletal pain, and serious infections (including endocarditis)'),
	(37, 'No hay un tratamiento satisfactorio para la osteoporosis', 'Eficacia modesta en prevención de fracturas osteoporóticas y no eficaz en pérdida ósea en cancer de próstata', 'Osteoporosis', 'es_ES', 'Denosumab 60 mg', 'Dolor de espalda, musculoesquelético, y infecciones graves (incluido endocarditis)'),
	(38, 'There are no effective medications against joint deterioration and with a favorable benefit-risk balance', 'Efficacy not proven beyond placebo', 'Osteoarthritis', 'en_US', 'Diacerein', 'Gastrointestinal disorders (including gastrointestinal bleeding and melanosis coli), angioedema and hepatitis'),
	(38, 'No hay medicamentos eficaces frente el deterioro de la articulación y con un balance beneficio riesgo favorable', 'Eficacia no probada más allá de placebo', 'Osteoartritis', 'es_ES', 'Diacereína', 'Trastornos gastrointestinales (incluido hemorragia gastrointestinal y melanosis coli), angioedema y hepatitis'),
	(39, 'There are no effective medications against joint deterioration and with a favorable benefit-risk balance', 'Efficacy not proven beyond placebo', 'Osteoarthritis', 'en_US', 'Glucosamine', 'Allergic reactions (angioedema, acute interstitial nephritis) and hepatitis'),
	(39, 'No hay medicamentos eficaces frente el deterioro de la articulación y con un balance beneficio riesgo favorable', 'Eficacia no probada más allá de placebo', 'Osteoartritis', 'es_ES', 'Glucosamina', 'Reacciones alérgicas (angioedema, nefritis intersticial aguda) y hepatitis'),
	(40, 'Unacceptable alternative even when systemic or local analgesics, such as lidocaine patches fail', 'Barely more effective than placebo', 'Neuropathic pain', 'en_US', 'Capsaicin', 'Irritation, severe pain and burns'),
	(40, 'Alternativa inaceptable aún cuando los analgésicos sitémicos o locales, como lidocaína en parches fallan', 'Apenas más eficaz que placebo', 'Dolor neuropático', 'es_ES', 'Capsaicina', 'Irritación, dolor grave y quemaduras'),
	(41, 'A paracetamol-type analgesic is a better option', 'Efficacy not proven beyond placebo', 'Muscle relaxant', 'en_US', 'Methocarbamol', 'Gastrointestinal and skin disorders (angioedema)'),
	(41, 'Un analgésico tipo paracetamol es una mejor opción', 'Eficacia no probada más allá de placebo', 'Relajante muscular', 'es_ES', 'Metocarbamol', 'Trastornos gastrointestinales y cutáneos (angioedema)'),
	(42, 'Combination estrogen/progestogen used at the lowest dose for the shortest possible time', 'Combination of conjugated estrogen and estrogen receptor modulator', 'Hormone therapy', 'en_US', 'Conjugated estrogens', 'The risk of thrombosis and hormone-dependent cancers has not been adequately evaluated'),
	(42, 'Combinación estrógeno/progestágeno usado a la menor dosis el menor tiempo posible', 'Combinación de estrógeno conjugado y modulador de receptor estrogénico', 'Terapia hormonal', 'es_ES', 'Estrogenos conjugados', 'El riesgo de trombosis y cánceres hormono dependientes no ha sido adecuadamente evaluado'),
	(43, 'Inhaled brochodilators and corticosteroids, and occasionally oxygen therapy', 'Does not increase survival or improve quality of life', 'Lung disease', 'en_US', 'Roflumilast', 'Gastrointestinal disorders, weight loss, mental disorders (including depression and suicide), and possibly cancers'),
	(43, 'Brocodilatadores y corticoides inhalados, y ocasionalmente oxigenoterapia', 'No aumenta la supervivencia ni mejora la calidad de vida', 'Enfermedad pulmonar', 'es_ES', 'Roflumilast', 'Trastornos gastrointestinales, pérdida de peso, trastornos mentales (incluido depresión y suicidio) y posiblemente cánceres'),
	(44, 'Levonorgestrel intrauterine device (IUD) is the first option, oral progestin alternative (both options are less risky)', 'Progesterone receptor modulator', 'Uterine fibroids', 'en_US', 'Ulipristal', 'Liver damage that may require transplant'),
	(44, 'Dispositivo intrauterino de levonorgestrel (DIU) es la primera opción,alternativa progestágeno oral (ambas opciones son menos arriesgadas)', 'Modulador de receptores de progesterona', 'Miomas uterinos', 'es_ES', 'Ulipristal', 'Daño hepático que puede requerir de transplante'),
	(45, 'Oral analgesics such as paracetamol and sometimes topical lidocaine', 'Efficacy not proven beyond placebo', 'Anal fissure', 'en_US', 'Glyceryl trinitrate', 'Headache that may be severe'),
	(45, 'Analgésicos orales como el paracetamol y en ocasiones lidocaína tópica', 'Eficacia no probada más allá de placebo', 'Fisura anal', 'es_ES', 'Trinitrato de glicerilo', 'Dolor de cabeza que puede ser grave');

-- Volcando estructura para tabla isbalanced.sanitaryalert
CREATE TABLE IF NOT EXISTS `sanitaryalert` (
  `drug` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe7nby65mo7lfrp1r13qf77q3u` (`drug`),
  CONSTRAINT `FKe7nby65mo7lfrp1r13qf77q3u` FOREIGN KEY (`drug`) REFERENCES `drug` (`drugId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla isbalanced.sanitaryalert: ~35 rows (aproximadamente)
DELETE FROM `sanitaryalert`;
INSERT INTO `sanitaryalert` (`drug`, `id`, `link`) VALUES
	(1, 1, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2014/docs/NI-MUH_FV_06-renina-angiotensina.pdf'),
	(4, 2, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2011/docs/NI-MUH_16-2011.pdf'),
	(5, 3, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2014/docs/NI-MUH_FV_17-ivabradina.pdf'),
	(8, 4, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2012/docs/NI-MUH_FV_11-2012.pdf'),
	(10, 5, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2006/docs/NI_2006-03_elidel-rizan-protopic.pdf'),
	(16, 6, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2007/docs/NI_2007-13_glitazonas.pdf'),
	(16, 7, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2007/docs/NI_2007-05_rosiglitazona.pdf'),
	(17, 8, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2011/docs/NI-MUH_24-2011.pdf'),
	(17, 9, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2014/docs/NI-MUH_FV_04-2014-domperidona.pdf'),
	(17, 10, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2020/docs/NI_MUH_FV-3-2020-Domperidona.pdf'),
	(19, 11, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2008/docs/NI_2008-04_moxifloxacino.pdf'),
	(25, 12, 'https://www.aemps.gob.es/informa/boletines-AEMPS/boletinMensual/2018/enero/docs/boletin-mensual-MUH_enero-2018.pdf'),
	(25, 13, 'https://cima.aemps.es/cima/DocsPub/16/887'),
	(26, 14, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2014/docs/NI-MUH_FV_14-2014-agomelatina.pdf'),
	(28, 15, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2011/docs/NI-MUH_19-2011.pdf'),
	(28, 16, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2011/docs/NI-MUH_19-2011.pdf'),
	(29, 17, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2011/docs/NI-MUH_23-2011.pdf'),
	(29, 18, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2011/docs/NI-MUH_23-2011.pdf'),
	(32, 19, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2004/docs/NI_2004-15_celecoxib-celebrex.pdf'),
	(32, 20, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2004/docs/NI_2004-15_celecoxib-celebrex.pdf'),
	(33, 21, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2005/docs/NI_2005-05_antiinflamatorios_COX_2.pdf'),
	(33, 22, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2006/docs/NI_2006-10_coxibs_AINE.pdf'),
	(33, 23, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2005/docs/NI_2005-05_antiinflamatorios_COX_2.pdf'),
	(33, 24, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2006/docs/NI_2006-10_coxibs_AINE.pdf'),
	(34, 25, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2014/docs/NI-MUH_FV_15-aceclofenaco.pdf'),
	(35, 26, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2013/docs/NI-MUH_FV_16-2013-diclofenaco.pdf'),
	(36, 27, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2007/docs/NI_2007-12_piroxicam.pdf'),
	(37, 28, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2014/docs/NI-MUH_FV_13-2014-Denosumab.pdf'),
	(37, 29, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2014/docs/NI-MUH_FV_13-2014-Denosumab.pdf'),
	(38, 30, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2014/docs/NI-MUH_FV_03-2014-diacereina.pdf'),
	(42, 31, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2008/docs/NI_2008-16_terapia_hormonal.pdf'),
	(44, 32, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2020/docs/NI_MUH_FV-4-2020-Esmya.pdf'),
	(44, 33, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2021/docs/NI_MUH_FV-05-2021-Esmya.pdf'),
	(44, 34, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2020/docs/NI_MUH_FV-4-2020-Esmya.pdf'),
	(44, 35, 'https://www.aemps.gob.es/informa/notasInformativas/medicamentosUsoHumano/seguridad/2021/docs/NI_MUH_FV-05-2021-Esmya.pdf');

-- Volcando estructura para tabla isbalanced.user
CREATE TABLE IF NOT EXISTS `user` (
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla isbalanced.user: ~1 rows (aproximadamente)
DELETE FROM `user`;
INSERT INTO `user` (`login`, `password`) VALUES
	('admin', '$2a$10$niY2.x2M7aqoUldHQs38k.LkQoaXsw/NzbrlyfR7HjyU8cAcQMbcG');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
