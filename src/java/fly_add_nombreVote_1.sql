ALTER TABLE `voiture` ADD `NOMBREVOTE` INT(11) NOT NULL DEFAULT '1' AFTER `RATTING`;
ALTER TABLE `worker` ADD `RATTING` DECIMAL(38,2) NOT NULL DEFAULT '3' AFTER `LONGITUDE`;
ALTER TABLE `worker` ADD `NOMBREVOTE` INT(11) NOT NULL DEFAULT '1' AFTER `RATTING`;
ALTER TABLE `DemandeVoitureItem` ADD `PRIXUNITAIRE` DECIMAL(38,2)  NOT NULL DEFAULT '1' AFTER `PRIX`;