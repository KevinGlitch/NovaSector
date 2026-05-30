import {
  //Blink,
  Box,
  //Button,
  //Modal,
  //NumberInput,
  ProgressBar,
  Section,
  //Stack,
  //Table,
} from 'tgui-core/components';
import { useBackend } from '../../backend';
import { MaterialAccessBar } from '../Fabrication/MaterialAccessBar';
import type { Material } from '../Fabrication/Types';

type Data = {
  status: string;
  containment: number;
  containment_max: number;
  start_charge: number;
  eff_extract: number;
  eff_charge: number;
  eff_contBuild: number;
  storage_cap: number;
  generate_iron: number;
  generate_glass: number;
  generate_plastic: number;
  generate_titanium: number;
  generate_plasma: number;
  generate_silver: number;
  generate_gold: number;
  generate_uranium: number;
  generate_diamond: number;
  generate_bluespace: number;
  storage_iron: number;
  storage_glass: number;
  storage_plastic: number;
  storage_titanium: number;
  storage_plasma: number;
  storage_silver: number;
  storage_gold: number;
  storage_uranium: number;
  storage_diamond: number;
  storage_bluespace: number;
};

export const ASMEInterface = (props, context) => {
  const { act, data } = useBackend<Data>();
  const {
    //Get EVERYTHING from the data values the machine has. This is a big list of stuff.
    status,
    containment,
    containment_max,
    start_charge,
    eff_extract,
    eff_charge,
    eff_contBuild,
    storage_cap,
    generate_iron,
    generate_glass,
    generate_plastic,
    generate_titanium,
    generate_plasma,
    generate_silver,
    generate_gold,
    generate_uranium,
    generate_diamond,
    generate_bluespace,
    storage_iron,
    storage_glass,
    storage_plastic,
    storage_titanium,
    storage_plasma,
    storage_silver,
    storage_gold,
    storage_uranium,
    storage_diamond,
    storage_bluespace,
  } = data;
  const mats = {}; //Pull from data.

  //TODO: Figure out how the f*ck to make a /datum/component/material_container

  return (
    <Box>
      <Box>
        <Section title="Singularity Containment Status">
          <ProgressBar value={containment / containment_max} />
        </Section>
        <Section title="Controls"></Section>
        <Section title="Statistics">
          <MaterialAccessBar
            availableMaterials={mats}
            SHEET_MATERIAL_AMOUNT={1}
            onEjectRequested={(material, amount) =>
              act('eject', { ref: material.ref, amount })
            }
          />
        </Section>
      </Box>
    </Box>
  );
};
