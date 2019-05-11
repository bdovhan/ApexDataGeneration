/**
 *     Apex Data Generation framework is a collection of apex classes which provide useful options for data generation
 *     in Salesforce.
 *     Copyright (C) 2018  Bohdan Dovhan a.k.a. Patlatus (patlatus.wordpress.com)
 *
 *     This program is free software: you can redistribute it and/or modify
 *     it under the terms of the GNU General Public License as published by
 *     the Free Software Foundation, either version 3 of the License, or
 *     (at your option) any later version.
 *
 *     This program is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU General Public License for more details.
 *
 *     You should have received a copy of the GNU General Public License
 *     along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 *   Setup is class which setups employees records using DataBuilder data generation factory
 */
public class Setup {
    public static void setupData(Integer size){
        DataBuilder b = new DataBuilder();
        b.loadJSONValuesFromStaticResource('names');
        b.buildFromGeneratorStringInStaticResource('employees', 'Employee', size);
    }

    public static void default() {
        delete [select id from Contact where RecordType.Name = 'Employee'];
        Setup.setupData(348);
    }
}